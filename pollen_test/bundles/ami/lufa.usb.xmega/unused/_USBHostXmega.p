
module USBHostXmega {
  
  +{
    #ifndef __USBHostXmega_P__
    #define __USBHostXmega_P__
  }+

  +{
    #if (ARCH == ARCH_XMEGA)
      #if defined(USB_CAN_BE_HOST)
        // No Host Functionality Now
      #endif    
    #endif
  }+

  +{ #endif /* __USBHostXmega_P__ */ }+
}