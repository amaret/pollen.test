
import CommonDefines
import Endianness
import USBMode

// LUFA Core Files
import USBTask
import Events
import StdDescriptors
import ConfigDescriptors

import USBController          // imports implementation from lufa.usb.xmega
import USBInterrupt           // imports implementation from lufa.usb.xmega

// LUFA USB Device files
import USBDevice              // imports implementation from lufa.usb.xmega
import Endpoint               // imports implementation from lufa.usb.xmega
import DeviceStandardRequests
import EndpointStream         // imports implementation from lufa.usb.xmega

import HIDParser
import MidiClassDevice


module USB {
  

  public init() {
    +{ USB_Init() }+
  }

  public doUSBTask() {
    +{ USB_USBTask() }+
  }
}