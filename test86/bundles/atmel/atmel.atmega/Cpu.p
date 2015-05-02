package atmel.atmega

!--
  Implementation of the Cpu protocol for atmega devices
 --!

from pollen.hardware import CpuProtocol

module Cpu implements CpuProtocol {

  +{ #include <avr/io.h> }+

  host Cpu() {
  }

  public reset() {
    # disable the watchdog timer (?), set system frequency
  }

  public shutdown() {
  }

  public wait(uint16 us) {
    # subtraction of cycles is for setup and operation of the for loop. Probably needs to be timed.
    uint32 i = (ticksPerUs * us) - 10

    for (; i > 0; --i) {
      +{ __asm__ __volatile__ ("nop") }+   
    }
  }

  public cycle() {
    +{ __asm__ __volatile__ ("nop") }+
  }

  public uint32 getFrequency() {
    return sysFreq
  }

  public host uint32 getFrequencyOnHost() {
    return sysFreq
  }

  public setFrequency(uint32 hz) {
    sysFreq = hz
    # This should now set the Cpu frequency to the new value if its different.
  }

  public host setFrequencyOnHost(uint32 hz) {
    sysFreq = hz
    ticksPerUs = (sysFreq / 1000000)   # must be megahertz, we probably want to do some rounding here
    print "SysFreq = " + sysFreq + " Cpu.ticksPerUs is: " + ticksPerUs + "\n"
  }

  !-------------------------------------------------------------------------
    Private data members
  --------------------------------------------------------------------------!
  host uint32 sysFreq = 1000000
  host uint32 ticksPerUs
}