#!/usr/bin/env python

import sys
import time
import pywinusb.hid as hid

CMD_SETRGBA = 20
CMD_ALLON   = 21
CMD_ALLOFF  = 22


class DisplayControl(object):


  def __init__(self):
    self.vendorID = 0x2323
    self.productID = 0x1111    
    self.device = self.getDevice()
    self.outReport = None
    self.inReport = None
    self.NumLeds = 24

    self.frameId = 23
    self.states = { "allOn":  [CMD_ALLON, 0, 0, 0, 0, 0, 0, 0], 
                    "allOff": [CMD_ALLOFF, 0, 0, 0, 0, 0, 0, 0],
                    "one":    [CMD_SETRGBA, 1, 1, 1, 1, 0, 0, 0],
                    "two":    [CMD_SETRGBA, 2, 1, 1, 1, 0, 0, 0],
                    "three":  [CMD_SETRGBA, 3, 1, 1, 1, 0, 0, 0]}

  def isValid(self):
    return self.device != None


  def getDevice(self):
    all_devices = hid.HidDeviceFilter(vendor_id= self.vendorID, product_id=self.productID).get_devices()

    if not all_devices:
      print("Can't find wind.io device!")
      return None
      
    else:
      return all_devices[0]


  def open(self):
    try:
      self.device.open()

      for report in self.device.find_output_reports():
        self.outReport = report 

      for report in self.device.find_input_reports():
        self.inReport = report
    except:
      print("Unexpected error on wind.io device open")
      raise


  def close(self):
    self.device.close()


  def write(self, data):
    packet = data[:]
    packet.insert(0, self.outReport.report_id)

    if len(packet) != 9:
      print("Write error: data must have a length of 8 bytes!")
    else:
      self.outReport.send(packet)


  def blink(self, times, rate = 0.1):
    for i in range(times):
      self.write(self.states["allOn"])
      time.sleep(rate)
      self.write(self.states["allOff"])
      time.sleep(rate)

  def walkup(self, rate = 0.1):
    for i in range(self.NumLeds):      
      frame = [CMD_SETRGBA, i, 1, 1, 1, 0, 0, 0]
      self.write(frame)
      time.sleep(rate)

  def walkdown(self, rate = 0.1):
    for i in range(self.NumLeds):      
      frame = [CMD_SETRGBA, self.NumLeds - 1 - i, 0, 0, 0, 0, 0, 0]
      self.write(frame)
      time.sleep(rate)


    self.write(self.states["allOff"])

if __name__ == '__main__':

  display = DisplayControl()
  display.open()

  if not display.isValid():
    print("Could not open display properly.")
    sys.exit(0)

  display.blink(5, 0.5)

  display.walkup(0.1)
  display.walkdown(0.1)

  display.close()


# def click_signal(target_usage, target_vendor_id):
#     """This function will find a particular target_usage over output reports on
#     target_vendor_id related devices, then it will flip the signal to simulate
#     a 'click' event"""
#     # usually you'll find and open the target device, here we'll browse for the
#     # current connected devices
#     all_devices = hid.HidDeviceFilter(vendor_id = target_vendor_id).get_devices()
    
#     if not all_devices:
#         print("Can't find target device (vendor_id = 0x%04x)!" % target_vendor_id)
#     else:
#         # search for our target usage
#         # target pageId, usageId
             
#         for device in all_devices:
#             try:
#                 device.open()
#                 # browse output reports, we could search over feature reports also,
#                 # changing find_output_reports() to find_feature_reports()
#                 for report in device.find_output_reports():
#                     print(report)
#                     report.send([report.report_id, 23, 1, 0, 0, 0, 0, 0, 0])
#                     time.sleep(.25)
#                     report.send([report.report_id, 23, 0, 1, 0, 0, 0, 0, 0])
#                     time.sleep(.25)
#                     report.send([report.report_id, 23, 0, 0, 1, 0, 0, 0, 0])

#                     time.sleep(.25)

#                     report.send([report.report_id, 23, 1, 0, 0, 0, 0, 0, 0])
#                     time.sleep(.25)
#                     report.send([report.report_id, 23, 0, 1, 0, 0, 0, 0, 0])
#                     time.sleep(.25)
#                     report.send([report.report_id, 23, 0, 0, 1, 0, 0, 0, 0])

#                     time.sleep(.25)

#                     report.send([report.report_id, 23, 1, 0, 0, 0, 0, 0, 0])
#                     time.sleep(.25)
#                     report.send([report.report_id, 23, 0, 1, 0, 0, 0, 0, 0])
#                     time.sleep(.25)
#                     report.send([report.report_id, 23, 0, 0, 1, 0, 0, 0, 0])

#                     time.sleep(.25)
#                     report.send([report.report_id, 23, 1, 1, 1, 0, 0, 0, 0])
#                     time.sleep(1)
#                     report.send([report.report_id, 23, 0, 0, 0, 0, 0, 0, 0])



#                     return


#                     #if target_usage in report:
#                     #    # found out target!
#                     #    report[target_usage] = 1 # yes, changing values is that easy
#                     #    # at this point you could change different usages at a time...
#                     #    # and finally send the prepared output report
#                     #    report.send()               
#                     #    # now toggle back the signal
#                     #    report[target_usage] = 0
#                     #    report.send()
#                     #    print("\nUsage clicked!\n")
#                     #    return
#             finally:
#                 device.close()
#         print("The target device was found, but the requested usage does not exist!\n")
#     #
# if __name__ == '__main__':
#     target_vendor_id = 0x2323 # just an example, change it to the actual vendor_id
#     target_usage = hid.get_full_usage_id(0xffa0, 0x02) # generic vendor page, usage_id = 2
#     # go for it!
#     click_signal(target_usage, target_vendor_id)

