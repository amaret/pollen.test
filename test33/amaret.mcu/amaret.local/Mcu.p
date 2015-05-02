!------------------------------------------------------------------------------
 Mcu device driver for your local host. 
 ------------------------------------------------------------------------------!

package amaret.local

from pollen.hardware import Mcu as McuProtocol

module Mcu implements McuProtocol {

  +{ #include <stdio.h> }+
  +{ #include <unistd.h> }+
   

  public reset() {
    +{ printf("Mcu.reset\n") }+
  }

  public shutdown() {
    +{ printf("Mcu.shutdown\n") }+
  }

  public wait(uint32 us) {
    +{ usleep(us) }+
  }

  public cycle() {
    +{ usleep(1) }+
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

  !-------------------------------------------------------------------------
  Private data members
  --------------------------------------------------------------------------!
  uint32 sysFreq
}
