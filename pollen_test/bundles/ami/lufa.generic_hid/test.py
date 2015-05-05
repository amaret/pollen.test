#!/usr/bin/env python

import os
import sys
import time
 
import usb.core
import usb.util
 
packet_len = 8
  
# Logs error to the error output
def log_error(functionName, ret):
  sys.stderr.write(functionName + (" failed with return code %d\n" % ret))
 
# Logs result onto standard output. Result is 64 bytes as decimal numbers
# Response is 64 bytes long
def show_result(bytes):
  sys.stdout.write("Result:")
  sys.stdout.write(''.join(['%d ' % abyte for abyte in bytes]))
 
# Turns LED on the bord on or off depending on input parameter on. 0 is turning
# the led on 1 is turning it off. The command is 0x9F set port bit (set output
# pin value), port is 0x03 (port C), 0x06 is bit index (so this is 7th bit),
# and the last bit is 0 for clear, 1 for set
def set_led(which, dev):
  # if which == "red":
  #     param = 0x00
  # else:
  #     param = 0x01

  data = [23, 255, 0, 0, 0]

  dev.write(0x02, data, 0, 100) 
 
 
def main():
 
  dev = usb.core.find(idVendor=0x2323, idProduct=0x1111)

  # was it found?
  if dev is None:
      raise ValueError('Device not found')

  try:
      dev.detach_kernel_driver(0)
  except: # this usually mean that kernel driver has already been dettached
      pass

  # set the active configuration, the device has 2 configurations you can see them
  # by using: lsusb -vvv -d 0x0b40:
  # this device has configurations 1 and 2 I'm using the first one, not sure at the
  # moment if 2nd would work the same
  dev.set_configuration(1)


  set_led(1, dev)
  time.sleep(1) 
 
 
if __name__ == '__main__':
  main()

