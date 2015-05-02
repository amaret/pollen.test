!------------------------------------------------------------------------------
 Device driver for the atmega8 microcontrollers.
 ------------------------------------------------------------------------------!

package atmel.atmega8

from pollen.hardware import Mcu as McuProtocol

module Mcu implements McuProtocol {

  +{ #include <avr/io.h> }+

  public reset() {
    # This method needs to set the mcu sys frequency! 
  }

  public shutdown() {
  
  }

  public wait(uint32 us) {
    uint8 i
    
    !-- This loop needs to be timed and checked for accuracy. Given mcu frequency, num of nops = 1us --!
    for (; us > 0; --us) {
      for (i = 0; i < nops; i++) {
        +{ asm("nop") }+
      }                              
    }
  }

  public cycle() {
    +{ asm("nop") }+
  }

  public uint32 getFrequency() {
    return sysFreq  
  }

  public host uint32 getFrequencyOnHost() {
    return sysFreq
  }

  public setFrequency(uint32 hz) {
    sysFreq = hz  
  }

  public host setFrequencyOnHost(uint32 hz) {
    sysFreq = hz
  }

!----------------------------------------------------------------------------
  Private data members
----------------------------------------------------------------------------!
  uint32 sysFreq
  host uint8 nops = 8
}