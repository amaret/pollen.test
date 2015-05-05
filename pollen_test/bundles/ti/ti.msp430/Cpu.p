
from pollen.hardware import CpuProtocol

module Cpu implements CpuProtocol {
  
  +{ #include <msp430.h> }+

  host uint32 mclkFreq = 8000000
  host uint32 smclkFreq = 8000000
  host uint32 aclkFreq = 0
  host uint32 ticksPerUs

  host Cpu() {
    ticksPerUs = (mclkFreq / 1000000)   # must be megahertz, we probably want to do some rounding here
  }

  public reset() {
    +{ WDTCTL = WDTPW |  WDTHOLD }+   // Stop watchdog timer

    // TODO: Add the rest of the frequencies here 
    if (mclkFreq == 8000000) {      // set master clock source to DCO   
        +{ BCSCTL1 = CALBC1_8MHZ }+
        +{ DCOCTL =  CALDCO_8MHZ }+
        // SMCLK set to MCLK source by default
    }
    
    +{ BCSCTL1 &= ~(XTS) }+     // set XTS bit to low frequency mode
    +{ BCSCTL3 |= LFXT1S_2 }+   // set ACLK to VLOCLK 

  }

  public shutdown() {

  }

  public host setFrequencyOnHost(uint32 hz) {
    mclkFreq = hz
    ticksPerUs = (mclkFreq / 1000000)   # must be megahertz, we probably want to do some rounding here
    print "MclkFreq = " + mclkFreq + " Cpu.ticksPerUs is: " + ticksPerUs + "\n"
  }

  public setFrequency(uint32 hz) {
    mclkFreq = hz
    // This should now set the Cpu frequency to the new value if its different.
  }

  public host uint32 getFrequencyOnHost() {
    return mclkFreq
  }

  public uint32 getFrequency() {
    return mclkFreq
  }
     
  public wait(uint16 us) {
    // subtraction of cycles is for setup and operation of the for loop. Probably needs to be timed.
    uint32 i = (ticksPerUs * us) - 10

    for (; i > 0; --i) {
      +{ __asm__ __volatile__ ("nop") }+   
    }
  }

  public cycle() {
    +{ __asm__ __volatile__ ("nop") }+
  }

}