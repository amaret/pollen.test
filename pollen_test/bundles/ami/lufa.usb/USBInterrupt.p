import CommonDefines
import USBMode

// TODO - this file needs a protocol member for the implementation of the controller functions
from lufa.usb.xmega import USBInterruptXmega

module USBInterrupt {
  
 +{
    #ifndef __USBInterrupt_P__
    #define __USBInterrupt_P__
  }+

  // +{
  //   /* Architecture Includes: */
  //   #if (ARCH == ARCH_AVR8)
  //     #include "AVR8/USBInterrupt_AVR8.h"
  //   #elif (ARCH == ARCH_XMEGA)
  //     #include "XMEGA/USBInterrupt_XMEGA.h"
  //   #endif
  // }+

  +{ #endif /* __USBInterrupt_P__ */ }+

}