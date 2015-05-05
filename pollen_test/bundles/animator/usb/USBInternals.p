
import USBDefines
import EventDefines
import PipeDefines

module USBInternals {

  +{ 
    #ifndef __USBInternals_P__
    #define __USBInternals_P__
  }+

  //=============================================
  // usb.h
  //=============================================

  +{
    inline void USB_ep_init(uint8_t ep, uint8_t type, uint16_t bufsize) ATTR_ALWAYS_INLINE;
    inline void USB_ep_init(uint8_t ep, uint8_t type, uint16_t bufsize){
      _USB_EP(ep);
      if (ep & USB_EP_PP){
        _USB_EP_OTHER(ep);
        e->STATUS = USB_EP_BUSNACK0_bm | USB_EP_BUSNACK1_bm;
        e->CTRL = type | USB_EP_size_to_gc(bufsize) | USB_EP_PINGPONG_bm;
        other->CTRL = 0;
        other->STATUS = USB_EP_BUSNACK0_bm;
      }else{
        e->STATUS = USB_EP_BUSNACK0_bm;
        e->CTRL = type | USB_EP_size_to_gc(bufsize);
      }
    }

    inline void USB_ep_cancel(uint8_t ep) ATTR_ALWAYS_INLINE;
    inline void USB_ep_cancel(uint8_t ep){
      _USB_EP(ep);
      if (ep & USB_EP_PP){
        LASR16(&e->STATUS, USB_EP_BUSNACK0_bm | USB_EP_BUSNACK1_bm);
        LACR16(&e->STATUS, USB_EP_BANK_bm);
      }else{
        LASR16(&e->STATUS, USB_EP_BUSNACK0_bm);
      }
    }

    inline void USB_ep_start_bank(uint8_t ep, uint8_t bank, uint8_t* addr, uint16_t size){
      _USB_EP(ep);
      _USB_EP_BANK(ep, bank);
      b->DATAPTR = (unsigned) addr;
      if (ep & USB_EP_IN) b->CNT = size;
      
      //TODO: the OVF, STALL, and TRNCOMPL flags are in b->STATUS. Clear them if anyone cares.

      if (bank==0){
        LACR16(&(e->STATUS), USB_EP_BUSNACK0_bm | USB_EP_TRNCOMPL0_bm);
      }else{
        LACR16(&(e->STATUS), USB_EP_BUSNACK1_bm | USB_EP_TRNCOMPL1_bm);
      }
    }

    inline void USB_ep_out_start(uint8_t ep, uint8_t* addr) ATTR_ALWAYS_INLINE;
    inline void USB_ep_out_start(uint8_t ep, uint8_t* addr){
      USB_ep_start_bank(ep, 0, addr, 0);
    }

    inline void USB_ep_in_start(uint8_t ep, uint8_t* addr, uint16_t size) ATTR_ALWAYS_INLINE;
    inline void USB_ep_in_start(uint8_t ep, uint8_t* addr, uint16_t size){
      USB_ep_start_bank(ep, 0, addr, size);
    }

    inline bool USB_ep_done_bank(uint8_t ep, uint8_t bank){
      _USB_EP(ep);
      return e->STATUS & (bank?USB_EP_TRNCOMPL1_bm:USB_EP_TRNCOMPL0_bm);
    }

    inline bool USB_ep_done(uint8_t ep) ATTR_ALWAYS_INLINE;
    inline bool USB_ep_done(uint8_t ep){
      _USB_EP(ep);
      if (ep & USB_EP_PP){
        return e->STATUS & (USB_EP_TRNCOMPL0_bm|USB_EP_TRNCOMPL1_bm);
      }else{
        // Because for ep0, TRNCOMPL1 is SETUP
        return e->STATUS & USB_EP_TRNCOMPL0_bm;
      }
    }

    inline void USB_ep_clear_done(uint8_t ep) ATTR_ALWAYS_INLINE;
    inline void USB_ep_clear_done(uint8_t ep){
      _USB_EP(ep);
      if (ep & USB_EP_PP){
        LACR16(&(e->STATUS), USB_EP_TRNCOMPL0_bm|USB_EP_TRNCOMPL1_bm);
      }else{
        // Because for ep0, TRNCOMPL1 is SETUP
        LACR16(&(e->STATUS), USB_EP_TRNCOMPL0_bm);
      }
    }

    inline bool USB_ep_ready(uint8_t ep) ATTR_ALWAYS_INLINE;
    inline bool USB_ep_ready(uint8_t ep){
      _USB_EP(ep);
      return e->STATUS & (USB_EP_BUSNACK0_bm | USB_EP_BUSNACK1_bm);
    }

    inline bool USB_ep_empty(uint8_t ep) ATTR_ALWAYS_INLINE;
    inline bool USB_ep_empty(uint8_t ep){
      _USB_EP(ep);
      if (ep & USB_EP_PP){
        const uint8_t mask = (USB_EP_BUSNACK0_bm | USB_EP_BUSNACK1_bm);
        return (e->STATUS & mask) == mask;
      }else{
        return e->STATUS & USB_EP_BUSNACK0_bm;
      }
    }

    inline uint16_t USB_ep_count_bank(uint8_t ep, uint8_t bank) ATTR_ALWAYS_INLINE;
    inline uint16_t USB_ep_count_bank(uint8_t ep, uint8_t bank){
      _USB_EP(ep);
      _USB_EP_BANK(ep, bank);
      return b->CNT;
    }

    inline uint16_t USB_ep_count(uint8_t ep) ATTR_ALWAYS_INLINE;
    inline uint16_t USB_ep_count(uint8_t ep){
      return USB_ep_count_bank(ep, 0);
    }

    inline void USB_ep0_send(uint8_t size){
      USB_ep_in_start(0x80, ep0_buf_in, size);
    }
    void USB_ep0_send_progmem(const uint8_t* addr, uint16_t size);

    inline void USB_ep_wait(uint8_t ep) ATTR_ALWAYS_INLINE;
    inline void USB_ep_wait(uint8_t ep){
      while (!USB_ep_done(ep)){};
    }

    /// Select a certain bank of an endpoint for the next transfer
    inline void USB_ep_set_bank(uint8_t ep, uint8_t bank) ATTR_ALWAYS_INLINE;
    inline void USB_ep_set_bank(uint8_t ep, uint8_t bank){
      _USB_EP(ep);
      if (bank){
        LASR16(&(e->STATUS), USB_EP_BANK_bm);
      }else{
        LACR16(&(e->STATUS), USB_EP_BANK_bm);
      }
    }

    /// Get the bank 0/1 which will handle the next request on this endpoint
    inline uint8_t USB_ep_get_bank(uint8_t ep) ATTR_ALWAYS_INLINE;
    inline uint8_t USB_ep_get_bank(uint8_t ep){
      _USB_EP(ep);
      return !!(e->STATUS & USB_EP_BANK_bm);
    }


    // Enable the OUT stage on the default control pipe. This happens automatically
    // upon the return of HandleSetup, but use this function if it needs to happen
    // before returning (e.g. with USB_ep_wait()).
    inline void USB_ep0_enableOut(void) ATTR_ALWAYS_INLINE;
    inline void USB_ep0_enableOut(void){
      LACR16(&endpoints[0].out.STATUS, USB_EP_SETUP_bm | USB_EP_BUSNACK0_bm | USB_EP_TRNCOMPL0_bm | USB_EP_OVF_bm);
    }

    bool USB_HandleSetup(void);

    uint16_t CALLBACK_USB_GetDescriptor(const uint16_t wValue,
                                        const uint8_t wIndex,
                                        const void** const DescriptorAddress);

    /** Detaches the device from the USB bus. This has the effect of removing the device from any
     *  attached host, ceasing USB communications. If no host is present, this prevents any host from
     *  enumerating the device once attached until \ref USB_Attach() is called.
     */
    static inline void USB_Detach(void) ATTR_ALWAYS_INLINE;
    static inline void USB_Detach(void)
    {
      USB.CTRLB &= ~USB_ATTACH_bm;
    }

    /** Attaches the device to the USB bus. This announces the device's presence to any attached
     *  USB host, starting the enumeration process. If no host is present, attaching the device
     *  will allow for enumeration once a host is connected to the device.
     */
    static inline void USB_Attach(void) ATTR_ALWAYS_INLINE;
    static inline void USB_Attach(void)
    {
      USB.CTRLB |= USB_ATTACH_bm;
    }

    inline void USB_Evt_Task(void) ATTR_ALWAYS_INLINE;
    inline void USB_Evt_Task(void){
      if (USB.STATUS & USB_BUSRST_bm){
        USB.STATUS &= ~USB_BUSRST_bm;
        USB_Init();
      }
    }

    inline void USB_Task(void) ATTR_ALWAYS_INLINE;
    inline void USB_Task(void){
      // Read once to prevent race condition where SETUP packet is interpreted as OUT
      uint8_t status = endpoints[0].out.STATUS;

      if (status & USB_EP_SETUP_bm){
        if (!USB_HandleSetup()){
          endpoints[0].out.CTRL |= USB_EP_STALL_bm;
          endpoints[0].in.CTRL |= USB_EP_STALL_bm; 
        }
        USB_ep0_enableOut();
      }else if(status & USB_EP_TRNCOMPL0_bm){
        EVENT_USB_Device_ControlOUT((uint8_t *) ep0_buf_out, endpoints[0].out.CNT);
        USB_ep0_enableOut();
      }
    }

    static inline void USB_enter_bootloader(void){
      cli();
      USB_ep0_send(0);
      USB_ep0_enableOut();
      USB_ep_wait(0x00); // Wait for the status stage to complete
      _delay_ms(10);
      USB_Detach();
      _delay_ms(100);
      void (*enter_bootloader)(void) = (void*) 0x47fc /*0x8ff8/2*/;
      enter_bootloader();
    }


  }+


  //=============================================
  // usb_xmega.c
  //=============================================

  +{
    // Minimal USB Stack for ATxmega32a4u and related
    // http://nonolithlabs.com
    // (C) 2011 Kevin Mehall (Nonolith Labs) <km@kevinmehall.net>
    //
    // Heavily borrows from LUFA
    // Copyright 2011  Dean Camera (dean [at] fourwalledcubicle [dot] com)
    //
    // Licensed under the terms of the GNU GPLv3+

    uint8_t ep0_buf_in[USB_EP0SIZE];
    uint8_t ep0_buf_out[USB_EP0SIZE];
    USB_EP_pair_t endpoints[USB_MAXEP+1] GCC_FORCE_ALIGN_2;

    volatile uint8_t USB_DeviceState;
    volatile uint8_t USB_Device_ConfigurationNumber;

    void USB_Init(){
      //uint_reg_t CurrentGlobalInt = GetGlobalInterruptMask();
      //GlobalInterruptDisable();

      NVM.CMD  = NVM_CMD_READ_CALIB_ROW_gc;
      USB.CAL0 = pgm_read_byte(offsetof(NVM_PROD_SIGNATURES_t, USBCAL0));
      NVM.CMD  = NVM_CMD_READ_CALIB_ROW_gc;
      USB.CAL1 = pgm_read_byte(offsetof(NVM_PROD_SIGNATURES_t, USBCAL1));

      //SetGlobalInterruptMask(CurrentGlobalInt);

      USB_ResetInterface(); 
    }

    void USB_ResetInterface(){

      //if (USB_Options & USB_DEVICE_OPT_LOWSPEED)
      //  CLK.USBCTRL = ((((F_USB / 6000000) - 1) << CLK_USBPSDIV_gp) | CLK_USBSRC_RC32M_gc | CLK_USBSEN_bm);
      //else
      CLK.USBCTRL = ((((F_USB / 48000000) - 1) << CLK_USBPSDIV_gp) | CLK_USBSRC_RC32M_gc | CLK_USBSEN_bm);
      USB.EPPTR = (unsigned) &endpoints;
      USB.ADDR = 0;
      
      endpoints[0].out.STATUS = 0;
      endpoints[0].out.CTRL = USB_EP_TYPE_CONTROL_gc | USB_EP_size_to_gc(USB_EP0SIZE);
      endpoints[0].out.DATAPTR = (unsigned) &ep0_buf_out;
      endpoints[0].in.STATUS = USB_EP_BUSNACK0_bm;
      endpoints[0].in.CTRL = USB_EP_TYPE_CONTROL_gc | USB_EP_size_to_gc(USB_EP0SIZE);
      endpoints[0].in.DATAPTR = (unsigned) &ep0_buf_in;
      
      USB.CTRLA = USB_ENABLE_bm | USB_SPEED_bm | USB_MAXEP;
      
      USB_Attach();
    }

    void USB_ep0_send_progmem(const uint8_t* addr, uint16_t size){
      uint8_t *buf = ep0_buf_in;
      uint16_t remaining = size;
      NVM.CMD = NVM_CMD_NO_OPERATION_gc;
      while (remaining--){
        *buf++ = pgm_read_byte(addr++);
      }
      USB_ep0_send(size);
    }

    void USB_ConfigureClock(){
      // Configure DFLL for 48MHz, calibrated by USB SOF
      OSC.DFLLCTRL = OSC_RC32MCREF_USBSOF_gc;
      NVM.CMD  = NVM_CMD_READ_CALIB_ROW_gc;
      DFLLRC32M.CALB = pgm_read_byte(offsetof(NVM_PROD_SIGNATURES_t, USBRCOSC));
      DFLLRC32M.COMP1 = 0x1B; //Xmega AU manual, 4.17.19
      DFLLRC32M.COMP2 = 0xB7;
      DFLLRC32M.CTRL = DFLL_ENABLE_bm;
      
      CCP = CCP_IOREG_gc; //Security Signature to modify clock 
        OSC.CTRL = OSC_RC32MEN_bm | OSC_RC2MEN_bm; // enable internal 32MHz oscillator
        
        while(!(OSC.STATUS & OSC_RC32MRDY_bm)); // wait for oscillator ready
        
        OSC.PLLCTRL = OSC_PLLSRC_RC2M_gc | 16; // 2MHz * 16 = 32MHz
        
        CCP = CCP_IOREG_gc;
        OSC.CTRL = OSC_RC32MEN_bm | OSC_PLLEN_bm | OSC_RC2MEN_bm ; // Enable PLL
        
        while(!(OSC.STATUS & OSC_PLLRDY_bm)); // wait for PLL ready
        
        DFLLRC2M.CTRL = DFLL_ENABLE_bm;

        CCP = CCP_IOREG_gc; //Security Signature to modify clock 
        CLK.CTRL = CLK_SCLKSEL_PLL_gc; // Select PLL
        CLK.PSCTRL = 0x00; // No peripheral clock prescaler
    }

  }+  

  //=============================================
  // usb_requests.c
  //=============================================

  +{

    inline bool USB_handleSetAddress(USB_Request_Header_t* req){
      uint8_t    DeviceAddress = (req -> wValue & 0x7F);
      USB_ep0_enableOut();
      USB_ep0_send(0);
      USB_ep_wait(0x80);
      USB.ADDR = DeviceAddress;
      USB_DeviceState = (DeviceAddress) ? DEVICE_STATE_Addressed : DEVICE_STATE_Default;
      return true;
    }

    #if !defined(NO_INTERNAL_SERIAL) && (USE_INTERNAL_SERIAL != NO_DESCRIPTOR)
    inline void USB_Device_GetSerialString(uint16_t* const UnicodeString) ATTR_NON_NULL_PTR_ARG(1);
    inline void USB_Device_GetSerialString(uint16_t* const UnicodeString){
      //uint_reg_t CurrentGlobalInt = GetGlobalInterruptMask();
      //GlobalInterruptDisable();
      
      uint8_t SigReadAddress = INTERNAL_SERIAL_START_ADDRESS;

      for (uint8_t SerialCharNum = 0; SerialCharNum < (INTERNAL_SERIAL_LENGTH_BITS / 4); SerialCharNum++)
      {         
        uint8_t SerialByte;

        NVM.CMD    = NVM_CMD_READ_CALIB_ROW_gc;
        SerialByte = pgm_read_byte(SigReadAddress);

        if (SerialCharNum & 0x01)
        {
          SerialByte >>= 4;
          SigReadAddress++;
        }

        SerialByte &= 0x0F;

        UnicodeString[SerialCharNum] = ((SerialByte >= 10) ?
                         (('A' - 10) + SerialByte) : ('0' + SerialByte));
      }
      
      //SetGlobalInterruptMask(CurrentGlobalInt);
    }

    inline void USB_Device_GetInternalSerialDescriptor(void)
    {
      struct
      {
        USB_Descriptor_Header_t Header;
        uint16_t                UnicodeString[INTERNAL_SERIAL_LENGTH_BITS / 4];
      }* SignatureDescriptor = (void*) ep0_buf_in;

      SignatureDescriptor->Header.Type = DTYPE_String;
      SignatureDescriptor->Header.Size = USB_STRING_LEN(INTERNAL_SERIAL_LENGTH_BITS / 4);
      
      USB_Device_GetSerialString(SignatureDescriptor->UnicodeString);

      USB_ep0_send(sizeof(*SignatureDescriptor));
    }
    #endif

    inline bool USB_handleGetDescriptor(USB_Request_Header_t* req){
      const void* DescriptorPointer;
      uint16_t  DescriptorSize;
      NVM.CMD = NVM_CMD_NO_OPERATION_gc;
      
      #if !defined(NO_INTERNAL_SERIAL) && (USE_INTERNAL_SERIAL != NO_DESCRIPTOR)
      if (req->wValue == ((DTYPE_String << 8) | USE_INTERNAL_SERIAL)){
        USB_Device_GetInternalSerialDescriptor();
        return true;
      }
      #endif
      
      if ((DescriptorSize = CALLBACK_USB_GetDescriptor(req->wValue, req->wIndex, &DescriptorPointer))){
        if (DescriptorSize > req->wLength) DescriptorSize=req->wLength;
        USB_ep0_send_progmem(DescriptorPointer, DescriptorSize);
        return true;
      }
      return false;
    }

    inline bool USB_handleSetConfiguration(USB_Request_Header_t* req){
      USB_Descriptor_Device_t* DevDescriptorPtr;

      uint8_t r = CALLBACK_USB_GetDescriptor((DTYPE_Device << 8), 0, (void*)&DevDescriptorPtr);
      if (r == NO_DESCRIPTOR) return false;
      
      NVM.CMD = NVM_CMD_NO_OPERATION_gc;
      uint8_t num_configs = pgm_read_byte(&DevDescriptorPtr->NumberOfConfigurations);
      
      if ((uint8_t)req->wValue > num_configs) return false;

      USB_ep0_send(0);
      USB_Device_ConfigurationNumber = (uint8_t)(req -> wValue);

      if (USB_Device_ConfigurationNumber)
        USB_DeviceState = DEVICE_STATE_Configured;
      else
        USB_DeviceState = (USB.ADDR) ? DEVICE_STATE_Configured : DEVICE_STATE_Powered;

      EVENT_USB_Device_ConfigurationChanged(USB_Device_ConfigurationNumber);
      return true;
    }

    bool USB_HandleSetup(void){
      USB_Request_Header_t* req = (void *) ep0_buf_out;
      
      if ((req->bmRequestType & CONTROL_REQTYPE_TYPE) == REQTYPE_STANDARD){
        switch (req->bRequest){
          case REQ_GetStatus:
            ep0_buf_in[0] = 0;
            ep0_buf_in[1] = 0;
            USB_ep0_send(2);
            return true;
          case REQ_ClearFeature:
          case REQ_SetFeature:
            USB_ep0_send(0);
            return true;
          case REQ_SetAddress:
            return USB_handleSetAddress(req);
          case REQ_GetDescriptor:
            return USB_handleGetDescriptor(req);
          case REQ_GetConfiguration:
            ep0_buf_in[0] = USB_Device_ConfigurationNumber;
            USB_ep0_send(1);
            return true;
          case REQ_SetConfiguration:
            return USB_handleSetConfiguration(req);
          case REQ_SetInterface:
            if (EVENT_USB_Device_SetInterface(req->wIndex, req->wValue)){
              USB_ep0_send(0);
              return true;
            }
          case REQ_GetInterface:
            return false;
        }
      }
      
      return EVENT_USB_Device_ControlRequest(req);
    }

  }+


  +{

    #include <util/atomic.h>
    #ifndef PIPE_ATOMIC
    #define PIPE_ATOMIC ATOMIC_RESTORESTATE
    #endif 

    typedef struct USB_Pipe_data{
      bool bank;
      uint8_t flush;
      uint16_t packet_offset; // Index into current packet for byte mode
    } USB_Pipe_data;

    // Immutable part, constant-folded at compile time
    typedef struct USB_Pipe{
      uint8_t ep;
      uint8_t type;
      USB_Pipe_data* data;
      const Pipe* pipe;
      uint8_t features;
    } USB_Pipe;

    #define PIPE_ENABLE_FLUSH (1<<0)

    #define USB_PIPE(NAME, EPNO, TYPE, PACKET_SIZE, BUFFER_PACKETS, FEATURES) \
      PIPE(NAME##_pipe, (BUFFER_PACKETS), (PACKET_SIZE),               \
        ((EPNO)&USB_EP_IN)?0:2,                      \
        ((EPNO)&USB_EP_IN)?2:0                       \
      );                                               \
      USB_Pipe_data NAME##_data = {      \
        .bank = 0,                   \
        .flush = 0,                    \
      };                                 \
      const static USB_Pipe NAME = {     \
        .ep = (EPNO),                  \
        .type = (TYPE),                \
        .data = &(NAME##_data),        \
        .pipe = &(NAME##_pipe),        \
        .features = (FEATURES),        \
      };                                 \

    static inline void usb_pipe_init(const USB_Pipe* p){
      ATOMIC_BLOCK(PIPE_ATOMIC){
        pipe_reset(p->pipe);
        USB_ep_init(p->ep, p->type, p->pipe->size);
        p->data->bank = 0;
        p->data->flush = 0;
        p->data->packet_offset = 0;
      }
    }

    static inline void usb_pipe_reset(const USB_Pipe* p){
      ATOMIC_BLOCK(PIPE_ATOMIC){
        pipe_reset(p->pipe);
        USB_ep_cancel(p->ep);
        p->data->flush = 0;
        p->data->packet_offset = 0;
        p->data->bank = 0;
      }
    }

    static inline void _usb_pipe_ep_start(const USB_Pipe* p, uint8_t* data, uint16_t size) ATTR_ALWAYS_INLINE;
    static inline void _usb_pipe_ep_start(const USB_Pipe* p, uint8_t* data, uint16_t size){
      bool bank = 0;

      if (p->ep & USB_EP_PP){
        bank = p->data->bank;
        p->data->bank ^= 1;
      }

      if (bank == 0){ // Helps the optimzer constant-fold, since the multiply is expensive
        USB_ep_start_bank(p->ep, 0, data, size);
      }else{
        USB_ep_start_bank(p->ep, 1, data, size);
      }
    }

    static inline void usb_pipe_handle(const USB_Pipe* p){
      ATOMIC_BLOCK(PIPE_ATOMIC){
        if (p->ep & USB_EP_IN){
          if (USB_ep_ready(p->ep)){
            if (pipe_can_read(p->pipe) >= 1){
              _usb_pipe_ep_start(p, pipe_read_ptr(p->pipe), p->pipe->size);
              pipe_done_read(p->pipe);
            }else if (p->features & PIPE_ENABLE_FLUSH){
              if (p->data->flush == 1){
                p->data->flush = 2;
                // Send short packet
                _usb_pipe_ep_start(p, pipe_read_ptr(p->pipe), p->data->packet_offset);
              }else if (p->data->flush == 2 && USB_ep_empty(p->ep)){
                p->data->flush = 0;
                p->data->packet_offset = 0;
                pipe_reset(p->pipe);
              }
            }
          }
        }else{
          if (USB_ep_ready(p->ep) && pipe_can_write(p->pipe) >= 1){
            _usb_pipe_ep_start(p, pipe_write_ptr(p->pipe), p->pipe->size);
            pipe_done_write(p->pipe);
          }
        }
      }
    }

    static inline void usb_pipe_flush(const USB_Pipe* p) ATTR_ALWAYS_INLINE;
    static inline void usb_pipe_flush(const USB_Pipe* p){
      GCC_ASSERT(p->features&PIPE_ENABLE_FLUSH && p->ep&USB_EP_IN);
      p->data->flush = 1;
      usb_pipe_handle(p);
    }

    static inline bool usb_pipe_flush_done(const USB_Pipe* p) ATTR_ALWAYS_INLINE;
    static inline bool usb_pipe_flush_done(const USB_Pipe* p){
      GCC_ASSERT(p->features&PIPE_ENABLE_FLUSH);
      return p->data->flush;
    }

    static inline bool usb_pipe_can_write(const USB_Pipe* p) ATTR_ALWAYS_INLINE;
    static inline bool usb_pipe_can_write(const USB_Pipe* p){
      bool r;
      ATOMIC_BLOCK(PIPE_ATOMIC){
        if (p->features&PIPE_ENABLE_FLUSH && p->data->flush){
          r = false;
        }else{
          r = pipe_can_write(p->pipe) > 0;
        }
      }
      return r;
    }

    static inline uint8_t* usb_pipe_write_ptr(const USB_Pipe* p){
      return pipe_write_ptr(p->pipe);
    }

    static inline void usb_pipe_done_write(const USB_Pipe* p){
      ATOMIC_BLOCK(PIPE_ATOMIC){
        pipe_done_write(p->pipe);
      }
    }

    static inline bool usb_pipe_can_read(const USB_Pipe* p) ATTR_ALWAYS_INLINE;
    static inline bool usb_pipe_can_read(const USB_Pipe* p){
      bool r;
      ATOMIC_BLOCK(PIPE_ATOMIC){
        r = pipe_can_read(p->pipe) > 0;
      }
      return r;
    }

    static inline uint8_t* usb_pipe_read_ptr(const USB_Pipe* p){
      return pipe_read_ptr(p->pipe);
    }

    static inline void usb_pipe_done_read(const USB_Pipe* p){
      ATOMIC_BLOCK(PIPE_ATOMIC){
        pipe_done_read(p->pipe);
      }
    }

    static inline uint8_t usb_pipe_read_byte(const USB_Pipe* p){
      uint8_t r = p->pipe->data->read_ptr[p->data->packet_offset++];
      if (p->data->packet_offset == p->pipe->size){
        ATOMIC_BLOCK(PIPE_ATOMIC){
          p->data->packet_offset = 0;
          pipe_done_read(p->pipe);
          usb_pipe_handle(p);
        }
      }
      return r;
    }

    static inline void usb_pipe_write_byte(const USB_Pipe* p, uint8_t v){
      p->pipe->data->write_ptr[p->data->packet_offset++] = v;
      if (p->data->packet_offset == p->pipe->size){
        ATOMIC_BLOCK(PIPE_ATOMIC){
          p->data->packet_offset = 0;
          pipe_done_write(p->pipe);
          usb_pipe_handle(p);
        }
      }
    }

  }+

  +{ #endif /* End ifdef __USBInternals_P__ */ }+
}