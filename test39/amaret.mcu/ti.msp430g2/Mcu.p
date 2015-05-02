package ti.msp430g2

!-----------------------------------------------------------------------------
 Device driver for the Texas Instruments MSP30G2xxx value-line family of
 microcontrollers.
 
 Family parts (add as supported): msp430g2211, g2231, g2452.
------------------------------------------------------------------------------!

from pollen.hardware import Mcu as McuProtocol

meta { string device }
module Mcu implements McuProtocol {

  +{ #include <device> }+

  host uint32 mclkFrequency
  host uint32 smclkFrequency
  host uint32 aclkFrequency

  public reset() {
    +{WDTCTL}+ = +{WDTPW}+ | +{WDTHOLD}+    # Stop watchdog timer

    # TODO: Add the rest of the frequencies here 
    # if (mclkFrequency == 8000000) {           # set master clock source to DCO   
    #    +{BCSCTL1}+ = +{CALBC1_8MHZ}+
    #    +{DCOCTL}+ = +{CALDCO_8MHZ}+
    #    # SMCLK set to MCLK source by default
    # }
    
    # +{BCSCTL1}+ &= ~(+{XTS}+)         # set XTS bit to low frequency mode
    # +{BCSCTL3}+ |= +{LFXT1S_2}+       # set ACLK to VLOCLK
  }

  public shutdown() {
  
  }

  public wait(uint32 us) {
    !-- This loop should be generated. Given mcu frequency, num of nops = 1us --!
    for (; us > 0; --us) {
      +{ asm ("nop") }+
      +{ asm ("nop") }+
      +{ asm ("nop") }+
      +{ asm ("nop") }+      
    }
  }

  public cycle() {
    +{ asm ("nop") }+
  }

  public uint32 getFrequency() {
    return mclkFrequency  
  }

  public host uint32 getFrequency() {
    return mclkFrequency
  }

  public setFrequency(uint32 hz) {
    mclkFrequency = hz  
  }

  public host setFrequency(uint32 hz) {
    mclkFrequency = hz
  }

}