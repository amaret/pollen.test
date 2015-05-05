import CommonDefines
import USBMode

import USBControllerDefines
// TODO - this file needs a protocol member for the implementation of the controller functions
from lufa.usb.xmega import USBControllerXmega

module USBController {
  
  +{
    #ifndef __USBController_P__
    #define __USBController_P__
  }+


  // /* Architecture Includes: */
  //   #if (ARCH == ARCH_AVR8)
  //     #include "AVR8/USBController_AVR8.h"
  //   #elif (ARCH == ARCH_XMEGA)
  //     #include "XMEGA/USBController_XMEGA.h"
  //   #endif

  // }+

  +{ #endif /* __USBController_P__ */ }+

}