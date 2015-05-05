
from lufa.usb import CommonDefines
from lufa.usb import USBMode
from lufa.usb import Events
from lufa.usb import USBTask
from lufa.usb import USBInterrupt

import USBControllerXmegaDefines

from lufa.usb import USBDevice
from lufa.usb import Endpoint
from lufa.usb import DeviceStandardRequests
from lufa.usb import EndpointStream

module USBControllerXmega {
  
  +{
    #ifndef __USBControllerXmega_P__
    #define __USBControllerXmega_P__
  }+

  +{ #if (ARCH == ARCH_XMEGA) }+

  +{
      /* Inline Functions: */
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
         *
         *  This is inexplicably also required for proper operation while in host mode, to enable the
         *  attachment of a device to the host. This is despite the bit being located in the device-mode
         *  register and despite the datasheet making no mention of its requirement in host mode.
         */
        static inline void USB_Attach(void) ATTR_ALWAYS_INLINE;
        static inline void USB_Attach(void)
        {
          USB.CTRLB |= USB_ATTACH_bm;
        }


    /* Private Interface - For use in library only: */
    #if !defined(__DOXYGEN__)
      /* Function Prototypes: */
        //#if defined(__INCLUDE_FROM_USB_CONTROLLER_C)
          static void USB_Init_Device(void);
        //#endif

      /* Inline Functions: */
        static inline void USB_Controller_Enable(void) ATTR_ALWAYS_INLINE;
        static inline void USB_Controller_Enable(void)
        {
          USB.CTRLA |=  USB_ENABLE_bm;
        }

        static inline void USB_Controller_Disable(void) ATTR_ALWAYS_INLINE;
        static inline void USB_Controller_Disable(void)
        {
          USB.CTRLA &= ~USB_ENABLE_bm;
        }

        static inline void USB_Controller_Reset(void) ATTR_ALWAYS_INLINE;
        static inline void USB_Controller_Reset(void)
        {
          USB.CTRLA &= ~USB_ENABLE_bm;
          USB.CTRLA |=  USB_ENABLE_bm;
        }

    #endif

  }+

  +{
    #if defined(USB_CAN_BE_BOTH)
    volatile uint8_t USB_CurrentMode = USB_MODE_None;
    #endif

    #if !defined(USE_STATIC_OPTIONS)
    volatile uint8_t USB_Options;
    #endif

    /* Ugly workaround to ensure an aligned table, since __BIGGEST_ALIGNMENT__ == 1 for the 8-bit AVR-GCC toolchain */
    uint8_t USB_EndpointTable[sizeof(USB_EndpointTable_t) + 1];

    void USB_Init(
                   #if defined(USB_CAN_BE_BOTH)
                   const uint8_t Mode
                   #endif

                   #if (defined(USB_CAN_BE_BOTH) && !defined(USE_STATIC_OPTIONS))
                   ,
                   #elif (!defined(USB_CAN_BE_BOTH) && defined(USE_STATIC_OPTIONS))
                   void
                   #endif

                   #if !defined(USE_STATIC_OPTIONS)
                   const uint8_t Options
                   #endif
                   )
    {
      #if !defined(USE_STATIC_OPTIONS)
      USB_Options = Options;
      #endif

      uint_reg_t CurrentGlobalInt = GetGlobalInterruptMask();
      GlobalInterruptDisable();

      NVM.CMD  = NVM_CMD_READ_CALIB_ROW_gc;
      USB.CAL0 = pgm_read_byte(offsetof(NVM_PROD_SIGNATURES_t, USBCAL0));
      USB.CAL1 = pgm_read_byte(offsetof(NVM_PROD_SIGNATURES_t, USBCAL1));
      NVM.CMD  = NVM_CMD_NO_OPERATION_gc;

      /* Ugly workaround to ensure an aligned table, since __BIGGEST_ALIGNMENT__ == 1 for the 8-bit AVR-GCC toolchain */
      USB.EPPTR = ((intptr_t)&USB_EndpointTable[1] & ~(1 << 0));
      USB.CTRLA = (USB_STFRNUM_bm | ((ENDPOINT_TOTAL_ENDPOINTS - 1) << USB_MAXEP_gp));

      if ((USB_Options & USB_OPT_BUSEVENT_PRIHIGH) == USB_OPT_BUSEVENT_PRIHIGH)
        USB.INTCTRLA = (3 << USB_INTLVL_gp);
      else if ((USB_Options & USB_OPT_BUSEVENT_PRIMED) == USB_OPT_BUSEVENT_PRIMED)
        USB.INTCTRLA = (2 << USB_INTLVL_gp);
      else
        USB.INTCTRLA = (1 << USB_INTLVL_gp);

      SetGlobalInterruptMask(CurrentGlobalInt);

      #if defined(USB_CAN_BE_BOTH)
      USB_CurrentMode = Mode;
      #endif

      USB_IsInitialized = true;

      USB_ResetInterface();
    }

    void USB_Disable(void)
    {
      USB_INT_DisableAllInterrupts();
      USB_INT_ClearAllInterrupts();

      USB_Detach();
      USB_Controller_Disable();

      USB_IsInitialized = false;
    }

    void USB_ResetInterface(void)
    {
      #if defined(USB_DEVICE_OPT_FULLSPEED)
      if (USB_Options & USB_DEVICE_OPT_LOWSPEED)
        CLK.USBCTRL = (((F_USB / 6000000) - 1) << CLK_USBPSDIV_gp);
      else
        CLK.USBCTRL = (((F_USB / 48000000) - 1) << CLK_USBPSDIV_gp);
      #else
      CLK.USBCTRL = (((F_USB / 6000000) - 1) << CLK_USBPSDIV_gp);
      #endif

      if (USB_Options & USB_OPT_PLLCLKSRC)
        CLK.USBCTRL |= (CLK_USBSRC_PLL_gc   | CLK_USBSEN_bm);
      else
        CLK.USBCTRL |= (CLK_USBSRC_RC32M_gc | CLK_USBSEN_bm);

      USB_Device_SetDeviceAddress(0);

      USB_INT_DisableAllInterrupts();
      USB_INT_ClearAllInterrupts();

      USB_Controller_Reset();
      USB_Init_Device();
    }

    #if defined(USB_CAN_BE_DEVICE)
    static void USB_Init_Device(void)
    {
      USB_DeviceState                 = DEVICE_STATE_Unattached;
      USB_Device_ConfigurationNumber  = 0;

      #if !defined(NO_DEVICE_REMOTE_WAKEUP)
      USB_Device_RemoteWakeupEnabled  = false;
      #endif

      #if !defined(NO_DEVICE_SELF_POWER)
      USB_Device_CurrentlySelfPowered = false;
      #endif

      #if !defined(FIXED_CONTROL_ENDPOINT_SIZE)
      USB_Descriptor_Device_t* DeviceDescriptorPtr;

      #if defined(ARCH_HAS_MULTI_ADDRESS_SPACE) && \
          !(defined(USE_FLASH_DESCRIPTORS) || defined(USE_EEPROM_DESCRIPTORS) || defined(USE_RAM_DESCRIPTORS))
      uint8_t DescriptorAddressSpace;

      if (CALLBACK_USB_GetDescriptor((DTYPE_Device << 8), 0, (void*)&DeviceDescriptorPtr, &DescriptorAddressSpace) != NO_DESCRIPTOR)
      {
        if (DescriptorAddressSpace == MEMSPACE_FLASH)
          USB_Device_ControlEndpointSize = pgm_read_byte(&DeviceDescriptorPtr->Endpoint0Size);
        else if (DescriptorAddressSpace == MEMSPACE_EEPROM)
          USB_Device_ControlEndpointSize = eeprom_read_byte(&DeviceDescriptorPtr->Endpoint0Size);
        else
          USB_Device_ControlEndpointSize = DeviceDescriptorPtr->Endpoint0Size;
      }
      #else
      if (CALLBACK_USB_GetDescriptor((DTYPE_Device << 8), 0, (void*)&DeviceDescriptorPtr) != NO_DESCRIPTOR)
      {
        #if defined(USE_RAM_DESCRIPTORS)
        USB_Device_ControlEndpointSize = DeviceDescriptorPtr->Endpoint0Size;
        #elif defined(USE_EEPROM_DESCRIPTORS)
        USB_Device_ControlEndpointSize = eeprom_read_byte(&DeviceDescriptorPtr->Endpoint0Size);
        #else
        USB_Device_ControlEndpointSize = pgm_read_byte(&DeviceDescriptorPtr->Endpoint0Size);
        #endif
      }
      #endif
      #endif

      if (USB_Options & USB_DEVICE_OPT_LOWSPEED)
        USB_Device_SetLowSpeed();
      else
        USB_Device_SetFullSpeed();

      Endpoint_ConfigureEndpoint(ENDPOINT_CONTROLEP, EP_TYPE_CONTROL,
                     USB_Device_ControlEndpointSize, 1);

      USB_INT_Enable(USB_INT_BUSEVENTI);

      USB_Attach();
    }
    #endif

  }+

  +{ #endif /* (ARCH == ARCH_XMEGA) */ }+

  +{ #endif /* __USBControllerXmega_P__ */ }+
}