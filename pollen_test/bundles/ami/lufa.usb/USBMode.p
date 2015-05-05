
module USBMode {
  
  +{
    #ifndef __USBMODE_P__
    #define __USBMODE_P__
  }+

  // Supported Devices

  +{
      #if (defined(__AVR_ATmega32U4__) || defined(__AVR_ATmega16U4__))
        #define USB_SERIES_4_AVR
        #define USB_CAN_BE_DEVICE
      #elif (defined(__AVR_ATxmega16C4__) || defined(__AVR_ATxmega32C4__))
        #define USB_SERIES_C4_XMEGA
        #define USB_CAN_BE_DEVICE
      #endif

  }+

  // Sanity check to see if configuration is valid

  +{
      #if (defined(USB_HOST_ONLY) && defined(USB_DEVICE_ONLY))
        #error USB_HOST_ONLY and USB_DEVICE_ONLY are mutually exclusive.
      #elif defined(USB_HOST_ONLY)
        #if !defined(USB_CAN_BE_HOST)
          #error USB_HOST_ONLY is not available for the currently selected microcontroller model.
        #else
          #undef USB_CAN_BE_DEVICE
        #endif
      #elif defined(USB_DEVICE_ONLY)
        #if !defined(USB_CAN_BE_DEVICE)
          #error USB_DEVICE_ONLY is not available for the currently selected microcontroller model.
        #else
          #undef USB_CAN_BE_HOST
        #endif
      #endif

      #if (defined(USB_CAN_BE_DEVICE) && defined(USB_CAN_BE_HOST))
        #define USB_CAN_BE_BOTH
      #endif

      #if (!defined(USB_CAN_BE_DEVICE) && !defined(USB_CAN_BE_HOST))
        #error The currently selected device, USB mode or architecture is not supported.
      #endif
  }+

  +{ #endif /* __USBMODE_P__ */ }+
}