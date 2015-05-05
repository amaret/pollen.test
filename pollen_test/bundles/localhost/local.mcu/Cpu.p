package local.mcu

!------------------------------------------------------------------------------
 Cpu driver that uses your local computer cpu 
 ------------------------------------------------------------------------------!

from pollen.hardware import CpuProtocol

module Cpu implements CpuProtocol {

  +{ #include <stdio.h> }+
  +{ #include <unistd.h> }+

  public reset() {
    +{ printf("Cpu.reset\n") }+
  }

  public shutdown() {
    +{ printf("Cpu.shutdown\n") }+
  }

  public wait(uint16 us) {
    +{ printf("Cpu.wait %u\n", us); usleep(us) }+ 
  }

  public cycle() {
    +{ printf("Cpu.cycle\n"); usleep(1) }+
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
  host uint32 sysFreq
}
