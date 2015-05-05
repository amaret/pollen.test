// USB Bootloader for Xmega AU
// http://nonolithlabs.com
// (C) 2011 Kevin Mehall (Nonolith Labs) <km@kevinmehall.net>
//
// Licensed under the terms of the GNU GPLv3+

#include "bootloader.h"
#include "sp_driver.h"

//
// Nonolith bootloader protocol
//

#define REQ_INFO		0xB0
// Returns a BootloaderInfo with info about the device
typedef struct{
	uint8_t magic[4]; // String 0x90 0x90 0xBB 0x01
	uint8_t version;
	uint8_t DEVID0;   // Device/Revision ID from MCU. See XMEGA AU Manual p46
	uint8_t DEVID1;
	uint8_t DEVID2;
	uint8_t REVID;
	uint16_t page_size;  // Page size in bytes
	uint32_t app_section_end; // Byte address of end of flash. Add one for flash size
	uint32_t entry_jmp_pointer; // App code can jump to this pointer to enter the bootloader
	char hw_product[16];
	char hw_version[16];
} BootloaderInfo;

#define REQ_ERASE		0xB1
// Erases the application section

#define REQ_START_WRITE 0xB2
// Sets the write pointer to the page address passed in wIndex.
// Data written to bulk endpoint 1 will be written at this address, and the
// address will be incremented automatically. The transfer is complete when a
// packet of less than 64 bytes is written.

#define REQ_CRC_APP		0xB3
// Return a CRC of the application section

#define REQ_CRC_BOOT	0xB4
// Return a CRC of the boot section

#define REQ_RESET	0xBF
// After acknowledging this request, the bootloader disables USB and resets
// the microcontroller

//
// End protocol definition
//


// Override these with parameters in the makefile
#ifndef HW_PRODUCT
#error "HW_PRODUCT not specified"
#endif

#ifndef HW_VERSION
#error "HW_VERSION not specified"
#endif

#ifndef CHECK_PORT
#define CHECK_PORT PORTR
#endif

#ifndef CHECK_PIN
#define CHECK_PIN 1
#endif
#ifndef APP_PIN
#define APP_PIN 0
#endif

#define STAT_PORT PORTE
#define STAT_PIN 3

#define CONCAT_HIDDEN(a, b, c) a##b##c
#define PINCTRL(n) CONCAT_HIDDEN(PIN, n, CTRL)

#define xstringify(s) stringify(s)
#define stringify(s) #s

/// Flash page number where received data will be written
uint16_t page;

/// Byte offset into flash page of next data to be received
uint16_t pageOffs;

/// Buffer of incoming flash page
uint8_t pageBuf[APP_SECTION_PAGE_SIZE];

/// Size of IN endpoint receiving flash data
#define EP1_SIZE 64

void pollEndpoint(void);

/// Configure the device for bootloader mode and loop responding to bootloader commands
void runBootloader(void) {
  // Invert PORTC/PORTD pins for proper PWM generation
  PORTC.PIN0CTRL
    = PORTC.PIN1CTRL
    = PORTC.PIN2CTRL
    = PORTC.PIN3CTRL
    = PORTC.PIN4CTRL
    = PORTC.PIN5CTRL
    = PORTC.PIN6CTRL
    = PORTC.PIN7CTRL
    = PORTD.PIN0CTRL
    = PORTD.PIN1CTRL
    = PORTD.PIN2CTRL
    = PORTD.PIN3CTRL
    = PORTD.PIN4CTRL
    = PORTD.PIN5CTRL
    = PORT_INVEN_bm;

  // Initialize output states
  PORTC.OUTCLR = 0xFF;
  PORTD.OUTCLR = 0x3F; // Avoid D-/D+

  PORTA.OUTSET = 0xFF;
  PORTB.OUTSET = 0xFF;
  PORTE.OUTSET = 0xFF;

  // Set all pins to output
  PORTA.DIRSET = 0xFF;
  PORTB.DIRSET = 0xFF;
  PORTC.DIRSET = 0xFF;
  PORTD.DIRSET = 0x3f; // Avoid D-/D+
  PORTE.DIRSET = 0xFF;

  // Set STAT pin to input
  STAT_PORT.DIRCLR = 1 << STAT_PIN;
  STAT_PORT.PINCTRL(STAT_PIN) = 0;

  // Fast PWM on ports C, D
  TCC0.CTRLA = TCD0.CTRLA = TC_CLKSEL_DIV1_gc;
  // Split the TC0s into TC2s
  TCC0.CTRLE = TCD0.CTRLE = 0x2;
  // Enable PWM on pins
  TCC0.CTRLB = 0xFF; // All 8 pins of PORTC
  TCD0.CTRLB = 0x0F; // First 4 pins of PORTD (for 12 total: clean with RGBs)

  // Full PWM period; initialize counter
  TCC0.PER = TCD0.PER = 0xFFFF;
  TCC0.CNT = TCD0.CNT = 0;

	USB_ConfigureClock();

	_delay_us(100000); // 0.1s

	USB_Init();
	USB_ep_init(1, USB_EP_TYPE_BULK_gc, EP1_SIZE);
	sei();

  while (true) {
    bool charging = !(STAT_PORT.IN & (1 << STAT_PIN));

    for (uint8_t i = 0; i < 5; i++) {
      for (uint32_t j = 0; j < 200000; ++j) {
        USB_Task();
        pollEndpoint();
      }

      if (charging) {
        switch (i) {
          case 0:
          default:
            // Clear all LEDs
            TCC0.CCA = TCC0.CCB = TCC0.CCC = TCC0.CCD =
              TCD0.CCA = TCD0.CCB = TCD0.CCC = TCD0.CCD = 0;
            break;
          case 1:
            // Use |= to preserve previously turned-on LEDs
            TCD0.CCD |= 0x0004;
            TCD0.CCC |= 0x0004;
            TCD0.CCB |= 0x0004;
            break;
          case 2:
            TCD0.CCA |= 0x0004;
            TCC0.CCD |= 0x0400;
            TCC0.CCC |= 0x0400;
            break;
          case 3:
            TCC0.CCB |= 0x0400;
            TCC0.CCA |= 0x0400;
            TCC0.CCD |= 0x0004;
            break;
          case 4:
            TCC0.CCC |= 0x0004;
            TCC0.CCB |= 0x0004;
            TCC0.CCA |= 0x0004;
            break;
        }
      } else {
        // Toggle LEDs
        TCC0.CCA = TCC0.CCB = TCC0.CCC = TCC0.CCD =
          TCD0.CCA = TCD0.CCB = TCD0.CCC = TCD0.CCD = (TCC0.CCA ? 0 : 0x0404);
      }
    }
  }
}

#define BOOTLOADER_MAGIC 0x9090BB01
uint32_t bootloaderflag __attribute__ ((section (".noinit")));

void reset_into_bootloader(void) ATTR_NO_INLINE;
void reset_into_bootloader(void){
  PMIC.CTRL = 0;
  bootloaderflag = BOOTLOADER_MAGIC;
  CCP = CCP_IOREG_gc;
  RST.CTRL = RST_SWRST_bm;
  while(1);
}

/// Jump target at known address to call from application code to switch to bootloader
extern void enterBootloader(void) __attribute__((used, naked, section(".boot-entry")));
void enterBootloader(void){
	reset_into_bootloader();
}

ISR(PORTR_INT0_vect) {
  enterBootloader();
}
ISR(PORTR_INT1_vect) {
  // Reset without magic flag to get into app (if it exists)
	PMIC.CTRL = 0;
  bootloaderflag = 0;
  CCP = CCP_IOREG_gc;
  RST.CTRL = RST_SWRST_bm;
  while(1);
}

int main(void){
	// Pull up PR0 to test if it's being pulled low
	CHECK_PORT.DIR = 0;
	CHECK_PORT.PINCTRL(CHECK_PIN) = PORT_OPC_PULLUP_gc | PORT_ISC_FALLING_gc;
	CHECK_PORT.PINCTRL(APP_PIN) = PORT_OPC_PULLUP_gc | PORT_ISC_FALLING_gc;

  // Setup falling-edge interrupt on first button
  CHECK_PORT.INT0MASK = (1 << CHECK_PIN);
  CHECK_PORT.INT1MASK = (1 << APP_PIN);
  CHECK_PORT.INTCTRL = PORT_INT0LVL_MED_gc | PORT_INT1LVL_MED_gc;
  PMIC.CTRL |= PMIC_LOLVLEN_bm | PMIC_MEDLVLEN_bm | PMIC_HILVLEN_bm;
  CCP = 0xD8; // Magic number to allow setting of the IVSEL bit
  // Move ISRs to boot space
  PMIC.CTRL |= PMIC_IVSEL_bm;
  sei();

	_delay_us(100);

  if (!(CHECK_PORT.IN & (1<<CHECK_PIN)) // If the specified pin is pulled LOW
//      || !(CHECK_PORT.IN & (1<<APP_PIN)) // If the specified pin is pulled LOW
      || pgm_read_word(0) == 0xFFFF // Get the value of the reset vector. If it's unprogrammed, we know
      // there's nothing useful in app flash
      || (RST.STATUS & RST_SRF_bm && bootloaderflag == BOOTLOADER_MAGIC) // If the app code reset into the bootloader
     ) {
		bootloaderflag = 0;
		runBootloader();
	}

	// Otherwise, clean up and jump to the app
	RST.STATUS = RST_SRF_bm;
	bootloaderflag = 0;
  // XXX: Need this??
	PORTR.PINCTRL(CHECK_PIN) = 0;
	PORTR.PINCTRL(APP_PIN) = 0;
	EIND = 0x00;
	void (*reset_vect)( void ) = 0x000000;
    reset_vect();
}


/// Pack the ep0 input buffer with a response to REQ_INFO
void fillInfoStruct(void){
	BootloaderInfo *i=(BootloaderInfo*)ep0_buf_in;
	i->magic[0] = 0x90;
	i->magic[1] = 0x90;
	i->magic[2] = 0xBB;
	i->magic[3] = 0x01;
	i->version = 1;
	i->DEVID0 = MCU.DEVID0;
	i->DEVID1 = MCU.DEVID1;
	i->DEVID2 = MCU.DEVID2;
	i->REVID = MCU.REVID;
	i->page_size = APP_SECTION_PAGE_SIZE;
	i->app_section_end = APP_SECTION_END;
	i->entry_jmp_pointer = (uint32_t) (unsigned) &enterBootloader;
	strncpy(i->hw_product, xstringify(HW_PRODUCT), 16);
	strncpy(i->hw_version, xstringify(HW_VERSION), 16);
}


/// Handle USB control requests
bool EVENT_USB_Device_ControlRequest(USB_Request_Header_t* req){
	if ((req->bmRequestType & CONTROL_REQTYPE_TYPE) == REQTYPE_VENDOR){
		switch (req->bRequest){
			case REQ_INFO:
				fillInfoStruct();
				USB_ep0_send(sizeof(BootloaderInfo));
				return true;
			case REQ_ERASE:
				SP_EraseApplicationSection();
				USB_ep0_send(0);
				return true;
			case REQ_START_WRITE:
				page = req->wIndex;
				pageOffs = 0;
				USB_ep_out_start(1, pageBuf);
				USB_ep0_send(0);
				return true;
			case REQ_CRC_APP:
				*(uint32_t*)ep0_buf_in = SP_ApplicationCRC();
				USB_ep0_send(sizeof(uint32_t));
				return true;
			case REQ_CRC_BOOT:
				*(uint32_t*)ep0_buf_in = SP_BootCRC();
				USB_ep0_send(sizeof(uint32_t));
				return true;
			case REQ_RESET:
				cli();
				USB_ep0_send(0);
				USB_ep0_enableOut();
        // PROBLEM LINE
				//USB_ep_wait(0x80); // Wait for the status stage to complete
				_delay_ms(10);
				USB_Detach();
				_delay_ms(100);
				bootloaderflag = 0;
				CCP = CCP_IOREG_gc;
				RST.CTRL = RST_SWRST_bm;
				while(1){};

				return true;
		}
	}

	return false;
}


void pollEndpoint(void){
	if (USB_ep_done(1)){

		pageOffs += EP1_SIZE;

		if (pageOffs == APP_SECTION_PAGE_SIZE){
			// Write a page to flash
			SP_LoadFlashPage(pageBuf);
			NVM.CMD = NVM_CMD_NO_OPERATION_gc;
			SP_WriteApplicationPage(page*APP_SECTION_PAGE_SIZE);
			SP_WaitForSPM();
			NVM.CMD = NVM_CMD_NO_OPERATION_gc;

			page++;
			pageOffs = 0;
		}

		if (page * APP_SECTION_PAGE_SIZE < APP_SECTION_END){
			// If there's remaining room in flash, configure the endpoint to accept more data
			USB_ep_out_start(1, &pageBuf[pageOffs]);
		}
	}
}
