import CommonDefines
import USBMode

import EndpointStreamDefines
from lufa.usb.xmega import EndpointStreamXmega 

module EndpointStream {

  +{
    #ifndef __USB_EndpointStream_P__
    #define __USB_EndpointStream_P__
  }+

  // +{
  //   /* Architecture Includes: */
  //     #if (ARCH == ARCH_AVR8)
  //       #include "AVR8/EndpointStream_AVR8.h"
  //     #elif (ARCH == ARCH_XMEGA)
  //       #include "XMEGA/EndpointStream_XMEGA.h"
  //     #endif
  // }+

  +{ #endif /* __USB_EndpointStream_P__ */ }+

}