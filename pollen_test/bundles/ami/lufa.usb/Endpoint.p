import CommonDefines
import USBMode

import EndpointDefines
from lufa.usb.xmega import EndpointXmega

module Endpoint {

  +{
    #ifndef __USB_Endpoint_P__
    #define __USB_Endpoint_P__
  }+

  // +{
  //   /* Architecture Includes: */
  //     #if (ARCH == ARCH_AVR8)
  //       #include "AVR8/Endpoint_AVR8.h"
  //     #elif (ARCH == ARCH_XMEGA)
  //       #include "XMEGA/Endpoint_XMEGA.h"
  //     #endif
  // }+

  +{ #endif /* __USB_Endpoint_P__ */ }+

}