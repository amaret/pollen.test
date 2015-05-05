package silabs.efm32

from pollen.hardware import CpuProtocol

module Cpu implements CpuProtocol {

  +{  
      #include "em_chip.h"
      #include "em_device.h"

      #include "em_assert.c"
      #include "em_bitband.h"
      #include "em_cmu.c"
      #include "em_system.c"
  }+

  // default starting frequency for EFM32 MCUs using internal HFRC O
  host uint32 frequency = 14000000    

  public reset() {   
    +{ CHIP_Init() }+                 // EFM32 Chip errata
    +{ SystemCoreClockUpdate() }+     // Ensure core frequency has been updated
  }  

  public shutdown() {

  } 

  public setFrequency(uint32 hz) {
    frequency = hz
  }

  public host setFrequencyOnHost(uint32 hz) {
    frequency = hz
  }

  public uint32 getFrequency() {
    return frequency
  }

  public host uint32 getFrequencyOnHost() {
    return frequency
  }
     
  public wait(uint16 us)  {
    us += (us / 4)    
    for (; us > 0; us--) {  
      +{ __asm__ __volatile__ ("nop") }+
      +{ __asm__ __volatile__ ("nop") }+
      +{ __asm__ __volatile__ ("nop") }+
      +{ __asm__ __volatile__ ("nop") }+
      +{ __asm__ __volatile__ ("nop") }+
      +{ __asm__ __volatile__ ("nop") }+
      +{ __asm__ __volatile__ ("nop") }+
      +{ __asm__ __volatile__ ("nop") }+
      +{ __asm__ __volatile__ ("nop") }+
      +{ __asm__ __volatile__ ("nop") }+
      +{ __asm__ __volatile__ ("nop") }+
      +{ __asm__ __volatile__ ("nop") }+
      +{ __asm__ __volatile__ ("nop") }+
      +{ __asm__ __volatile__ ("nop") }+
      +{ __asm__ __volatile__ ("nop") }+
    }
  }

  public cycle() {
   +{ __asm__ __volatile__ ("nop") }+
  }


}