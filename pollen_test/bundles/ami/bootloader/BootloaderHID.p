import pollen.environment as Env
from Env import GlobalInterrupts
from Env import WatchdogTimer
from Env import PA0

import BootloaderIncludes

//from atmel.lufa import Usb
//from atmel.lufa import Endpoint

module BootloaderHID {
  
  //===============================================================================================================//

  // Private Data

  const uint16 COMMAND_STARTAPPLICATION = 0xFFFF

  // Flag to indicate if the bootloader should be running, or should exit and allow the application code to run
  //  via a soft reset. When cleared, the bootloader will abort, the USB interface will shut down and the application
  //  started via a forced watchdog reset.
  bool RunBootloader = true

  uint8 data[9]
  uint8 dataIndex  = 0
  uint8 dataLength = 0

  uint8 buffer[130] = {0}
  uint8 bufferIndex  = 0
  uint8 bufferLength = 0

  bool receiveProgram = false
//uint8 CURRENT_FIRMWARE = 0
//uint8 MAJOR_VERSION    = 0
//uint8 MINOR_VERSION    = 0
//uint8 versionInfo[3]

  //===============================================================================================================//

  // USB Event handlers (should go into the USB module)

  // Event handler for the USB_ConfigurationChanged event. This configures the device's endpoints ready
  // to relay data to and from the attached USB host.
  +{ void EVENT_USB_Device_ConfigurationChanged(void) { `configurationChanged`(); } }+    

  // Event handler for the USB_ControlRequest event. This is used to catch and process control requests sent to
  // the device from the USB host before passing along unhandled control requests to the library for processing
  // internally.
  +{ void EVENT_USB_Device_ControlRequest(void) { `controlRequest`(); } }+

  //===============================================================================================================//


  pollen.reset() {
    // 1. applicationJumpCheck()

    // 2. SetupHardware()    
    WatchdogTimer.disable()
    PA0.clear()
    PA0.makeOutput()

    // Relocate the interrupt vector table to the bootloader section
    +{ PMIC.CTRL |= PMIC_IVSEL_bm }+

    // Read firmware version from eeprom
    //versionInfo[0] = eeprom_read_byte((uint8*)0x0002);
    //versionInfo[1] = eeprom_read_byte((uint8*)0x0003);
    //versionInfo[2] = eeprom_read_byte((uint8*)0x0004);
  }

  pollen.run() {

    // Initialize USB subsystem, enable global interrupts
    //Usb.initalize()
    GlobalInterrupts.enable()

    // Blink the LEDs! We're going into the bootload loop

    // Do our bootloader duties
    while(RunBootloader) {
    //  appHIDTask()
    //  Usb.doTask()
      PA0.toggle()
      delay(10)
    }

    // Start the application
    startApplication()
  }

  delay(uint16 dt) {
    for(uint16 i = 0; i < dt; i++) {
      Env.wait(1000)
    }
  }

  configurationChanged() {
    // Setup HID Report Endpoint 
    //Endpoint.configureEndpoint(HID_IN_EPADDR, EP_TYPE_INTERRUPT, HID_IN_EPSIZE, 1)
    // HID_IN_EPNUM, EP_TYPE_INTERRUPT, ENDPOINT_DIR_IN, HID_IN_EPSIZE, ENDPOINT_BANK_SINGLE
  }

  controlRequest() {
    // Ignore any requests that aren't directed to the HID interface
    // if ((USB_ControlRequest.bmRequestType & (CONTROL_REQTYPE_TYPE | CONTROL_REQTYPE_RECIPIENT)) !=
    //     (REQTYPE_CLASS | REQREC_INTERFACE)) {
    //   return
    // }

    // // Process HID specific control requests
    // switch (USB_ControlRequest.bRequest) {
    //   case HID_REQ_SetReport:
    //     Endpoint.clearSETUP()

    //     // Wait until the command has been sent by the host 
    //     while (!(Endpoint.isOUTReceived())) { }

    //     read()

    //     Endpoint.clearOUT()
    //     Endpoint.clearStatusStage()
    //     break
    // }
  }

  appHIDTask() {
    // Endpoint.selectEndpoint(HID_IN_EPADDR);
    
    // if(dataLength) {
    //   Endpoint.selectEndpoint(HID_IN_EPADDR);
    //   sendPacket();
    //   dataLength = 0;
    //   Endpoint.clearIN();
    // }
  }

  startApplication() {
  // Relocate the interrupt vector table to the application section
    // +{ PMIC.CTRL &= ~PMIC_IVSEL_bm }+

    // _delay_ms(500);
    // _delay_ms(500);

    // +{ __asm volatile("jmp 0x0000\n") }+
  }

}