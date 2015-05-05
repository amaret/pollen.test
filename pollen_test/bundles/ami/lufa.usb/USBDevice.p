import CommonDefines
import USBMode
import StdDescriptors
import USBInterrupt
import Endpoint

import USBDeviceDefines
// TODO - this file needs a protocol member for the implementation of the controller functions
from lufa.usb.xmega import USBDeviceXmega

module USBDevice {

  +{
    #ifndef __USBDevice_P__
    #define __USBDevice_P__
  }+

  // +{

  // /* Architecture Includes: */
  //   #if (ARCH == ARCH_AVR8)
  //     #include "AVR8/Device_AVR8.h"
  //   #elif (ARCH == ARCH_XMEGA)
  //     #include "XMEGA/Device_XMEGA.h"
  //   #endif

  // }+

  +{ #endif /* __USB_Device_P__ */ }+
}