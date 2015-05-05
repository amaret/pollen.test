from lufa.usb import USBMode
from lufa.usb import Events
from lufa.usb import USBController

import USBControllerXmegaDefines

module USBInterruptXmega {
  
  +{
    #ifndef __USBInterruptXmega_P__
    #define __USBInterruptXmega_P__
  }+

  +{ #if (ARCH == ARCH_XMEGA) }+

  +{
    /* Private Interface - For use in library only: */
    #if !defined(__DOXYGEN__)

      /* Inline Functions: */
        
        void USB_INT_Enable(const uint8_t Interrupt)
        {
          switch (Interrupt)
          {
            case USB_INT_BUSEVENTI:
              USB.INTCTRLA |= USB_BUSEVIE_bm;
              break;
            case USB_INT_SOFI:
              USB.INTCTRLA |= USB_SOFIE_bm;
              break;
            default:
              break;
          }
        }

        
        void USB_INT_Disable(const uint8_t Interrupt)
        {
          switch (Interrupt)
          {
            case USB_INT_BUSEVENTI:
              USB.INTCTRLA &= ~USB_BUSEVIE_bm;
              break;
            case USB_INT_SOFI:
              USB.INTCTRLA &= ~USB_SOFIE_bm;
              break;
            default:
              break;
          }
        }

        static inline void USB_INT_Clear(const uint8_t Interrupt) ATTR_ALWAYS_INLINE;
        static inline void USB_INT_Clear(const uint8_t Interrupt)
        {
          switch (Interrupt)
          {
            case USB_INT_BUSEVENTI_Suspend:
              USB.INTFLAGSACLR = USB_SUSPENDIF_bm;
              break;
            case USB_INT_BUSEVENTI_Resume:
              USB.INTFLAGSACLR = USB_RESUMEIF_bm;
              break;
            case USB_INT_BUSEVENTI_Reset:
              USB.INTFLAGSACLR = USB_RSTIF_bm;
              break;
            case USB_INT_SOFI:
              USB.INTFLAGSACLR = USB_SOFIF_bm;
              break;
            default:
              break;
          }
        }

        static inline bool USB_INT_IsEnabled(const uint8_t Interrupt) ATTR_ALWAYS_INLINE ATTR_WARN_UNUSED_RESULT;
        static inline bool USB_INT_IsEnabled(const uint8_t Interrupt)
        {
          switch (Interrupt)
          {
            case USB_INT_BUSEVENTI:
              return ((USB.INTCTRLA & USB_BUSEVIE_bm) ? true : false);
            case USB_INT_SOFI:
              return ((USB.INTCTRLA & USB_SOFIE_bm) ? true : false);
            default:
              return false;
          }
        }

        static inline bool USB_INT_HasOccurred(const uint8_t Interrupt) ATTR_ALWAYS_INLINE ATTR_WARN_UNUSED_RESULT;
        static inline bool USB_INT_HasOccurred(const uint8_t Interrupt)
        {
          switch (Interrupt)
          {
            case USB_INT_BUSEVENTI_Suspend:
              return ((USB.INTFLAGSACLR & USB_SUSPENDIF_bm) ? true : false);
            case USB_INT_BUSEVENTI_Resume:
              return ((USB.INTFLAGSACLR & USB_RESUMEIF_bm) ? true : false);
            case USB_INT_BUSEVENTI_Reset:
              return ((USB.INTFLAGSACLR & USB_RSTIF_bm) ? true : false);
            case USB_INT_SOFI:
              return ((USB.INTFLAGSACLR & USB_SOFIF_bm) ? true : false);
            default:
              return false;
          }
        }

    #endif

  }+

  +{

    void USB_INT_DisableAllInterrupts(void)
    {
      USB.INTCTRLA    &= USB_INTLVL_gm;
      USB.INTCTRLB     = 0;
    }

    void USB_INT_ClearAllInterrupts(void)
    {
      USB.INTFLAGSACLR = 0xFF;
      USB.INTFLAGSBCLR = 0xFF;
    }

    ISR(USB_BUSEVENT_vect)
    {
      #if !defined(NO_SOF_EVENTS)
      if (USB_INT_HasOccurred(USB_INT_SOFI) && USB_INT_IsEnabled(USB_INT_SOFI))
      {
        USB_INT_Clear(USB_INT_SOFI);

        EVENT_USB_Device_StartOfFrame();
      }
      #endif

      if (USB_INT_HasOccurred(USB_INT_BUSEVENTI_Suspend))
      {
        USB_INT_Clear(USB_INT_BUSEVENTI_Suspend);

        #if !defined(NO_LIMITED_CONTROLLER_CONNECT)
        USB_DeviceState = DEVICE_STATE_Unattached;
        EVENT_USB_Device_Disconnect();
        #else
        USB_DeviceState = DEVICE_STATE_Suspended;
        EVENT_USB_Device_Suspend();
        #endif
      }

      if (USB_INT_HasOccurred(USB_INT_BUSEVENTI_Resume))
      {
        USB_INT_Clear(USB_INT_BUSEVENTI_Resume);

        if (USB_Device_ConfigurationNumber)
          USB_DeviceState = DEVICE_STATE_Configured;
        else
          USB_DeviceState = (USB_Device_IsAddressSet()) ? DEVICE_STATE_Addressed : DEVICE_STATE_Powered;

        #if !defined(NO_LIMITED_CONTROLLER_CONNECT)
        EVENT_USB_Device_Connect();
        #else
        EVENT_USB_Device_WakeUp();
        #endif
      }

      if (USB_INT_HasOccurred(USB_INT_BUSEVENTI_Reset))
      {
        USB_INT_Clear(USB_INT_BUSEVENTI_Reset);

        USB_DeviceState                = DEVICE_STATE_Default;
        USB_Device_ConfigurationNumber = 0;

        USB_Device_EnableDeviceAddress(0);

        Endpoint_ClearEndpoints();
        Endpoint_ConfigureEndpoint(ENDPOINT_CONTROLEP, EP_TYPE_CONTROL,
                                   USB_Device_ControlEndpointSize, 1);

        EVENT_USB_Device_Reset();
      }
    }

  }+

  +{ #endif /* (ARCH == ARCH_XMEGA) */ }+

  +{ #endif /* __USBInterruptXmega_P__ */ }+
}