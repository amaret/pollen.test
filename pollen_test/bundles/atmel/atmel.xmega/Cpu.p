package atmel.xmega

from pollen.hardware import CpuProtocol

module Cpu implements CpuProtocol {
  
  +{ 
    #include <avr/io.h>
    #include <avr/interrupt.h> 
  }+

  enum ClockSource { INTERNAL_2M  = 1, 
                     INTERNAL_32M = 2, 
                     INTERNAL_32K = 4, 
                     XOSC         = 8, 
                     PLL          = 16 }

  public reset() {
    // disable the watchdog timer (?),

    // set system frequency
    //enableClockSource(clkSource)
    //selectMainClockSource(clkSource)
    // Disable real-time clock to save a little power
    //disableRTC()  // not using it now.
  }

  public shutdown() {

  }

  //
  // Millisecond busy wait.
  // This function has an error margin of between 2% - 5%. 
  // It needs to be re-written so that the # of nops reflects the Mcu 
  // frequency. Right now its set for a system frequency of 32MHz.
  //
  public wait(uint16 us) {
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

  public uint32 getFrequency() {
    return sysFreq
  }

  public host uint32 getFrequencyOnHost() {
    return sysFreq
  }

  public setFrequency(uint32 hz) {
    sysFreq = hz
    ticksPerUs = (sysFreq / 1000000)   // must be megahertz, we probably want to do some rounding here
    
    if (sysFreq == 32768) {
      clkSource = ClockSource.INTERNAL_32K
      enableClockSource(ClockSource.INTERNAL_32K)
    } elif (sysFreq == 2000000) {
      clkSource = ClockSource.INTERNAL_2M
      enableClockSource(ClockSource.INTERNAL_2M)
    } elif (sysFreq == 32000000) {
      clkSource = ClockSource.INTERNAL_32M
      enableClockSource(ClockSource.INTERNAL_32M)
    } else {
      clkSource = ClockSource.XOSC
      enableClockSource(ClockSource.XOSC)
    }

  }

  public host setFrequencyOnHost(uint32 hz) {
    sysFreq = hz
    ticksPerUs = (sysFreq / 1000000)   // must be megahertz, we probably want to do some rounding here

    if (sysFreq == 32768)      { clkSource = ClockSource.INTERNAL_32K } 
    elif (sysFreq == 2000000)  { clkSource = ClockSource.INTERNAL_2M  } 
    elif (sysFreq == 32000000) { clkSource = ClockSource.INTERNAL_32M } 
    else { clkSource = ClockSource.XOSC }

    print "Cpu frequency set to: " + sysFreq + "Hz\n"
  }


  !-------------------------------------------------------------------------
    Private members
  --------------------------------------------------------------------------!
  host uint32 sysFreq = 2000000
  host uint8 clkSource = ClockSource.INTERNAL_2M
  host uint32 ticksPerUs

  enum CCPReg { CLKCTRL = 0, CLKPSCTRL = 1, CLKLOCK = 2, XOSCFAIL = 3 }

  public enableClockSource(uint8 source) {
    +{OSC.CTRL}+ |= source
     while (!(+{OSC.STATUS}+ & source)) { }     // wait for clock to be ready
  }

  public uint8 disableClockSource(uint8 source) {
    +{ OSC.CTRL &= ~`source` }+
    uint8 clkEnabled = +{ OSC.CTRL }+ & source
    return clkEnabled
  }

  public bool selectCpuClockSource(uint8 source) {
    if (source == ClockSource.INTERNAL_32K)   { source = +{CLK_SCLKSEL_RC32K_gc}+ }
    elif (source == ClockSource.INTERNAL_2M)  { source = +{CLK_SCLKSEL_RC2M_gc}+  }
    elif (source == ClockSource.INTERNAL_32M) { source = +{CLK_SCLKSEL_RC32M_gc}+ }
    elif (source == ClockSource.XOSC)         { source = +{CLK_SCLKSEL_XOSC_gc}+  }
    elif (source == ClockSource.PLL)          { source = +{CLK_SCLKSEL_PLL_gc}+   }
    else { 
      return false
    }

    ccpWrite(CCPReg.CLKCTRL, +{(CLK.CTRL & ~CLK_SCLKSEL_gm)}+ | source)
    return (+{CLK.CTRL}+ & source) != 0
  }

  public bool startPLL(uint8 source, uint32 sourceFreq, uint32 targetFreq) {
    uint8 factor = (targetFreq / sourceFreq)

    if (sourceFreq > targetFreq) { return false }
    if (factor > 31) { return false }

    if (source == ClockSource.INTERNAL_2M)  { 
      +{OSC.PLLCTRL}+ = +{OSC_PLLSRC_RC2M_gc}+  | factor  
    } elif (source == ClockSource.INTERNAL_32M) { 
      +{OSC.PLLCTRL}+ = +{OSC_PLLSRC_RC32M_gc}+ | factor
    } elif (source == ClockSource.XOSC) { 
      +{OSC.PLLCTRL}+ = +{OSC_PLLSRC_XOSC_gc}+  | factor
    } else {
      return false
    }

    enableClockSource(ClockSource.PLL)
    return true
  }

  //
  // This function configures the internal high-frequency PLL.
  // Configuration of the internal high-frequency PLL to the correct values.
  // It is used to define the input of the PLL and the factor of multiplication
  // of the input clock source.
  //
  public configurePLL(uint8 source, uint8 factor) {
    factor &= +{ OSC_PLLFAC_gm }+
    +{ OSC.PLLCTRL }+ = source | (factor << +{ OSC_PLLFAC_gp }+)
  }


  //
  // Change the configuration of the three system clock prescaler in one single
  // operation. The user must make sure that the main CPU clock does not exceed
  // the recommended limits.
  //
  public configurePrescalers(uint8 aFactor, uint8 bcFactor) {
    ccpWrite(CCPReg.CLKPSCTRL, aFactor | bcFactor );
  }

  public enableRTC(uint8 source) {
    +{ CLK.RTCCTRL }+ = +{ (CLK.RTCCTRL & ~CLK_RTCSRC_gm) | CLK_RTCEN_bm }+ | source 
  }

  public disableRTC() {
    +{ CLK.RTCCTRL &= ~CLK_RTCEN_bm }+     // Disabling the RTC saves power if the RTC is not in use.
  }

  //
  // This function enables automatic calibration of the selected internal
  // oscillator. Either the internal 32kHz RC oscillator or an external 32kHz
  // crystal can be used as a calibration reference. The user must make sure
  // that the selected reference is ready and running.
  //
  enableAutoCalibration(uint8 source, bool extReference) {
    // OSC.DFLLCTRL = ( OSC.DFLLCTRL & ~clkSource ) | ( extReference ? clkSource : 0 );
    
    // if (clkSource == OSC_RC2MCREF_bm) {
    //   DFLLRC2M.CTRL |= DFLL_ENABLE_bm;
    // } else if (clkSource == OSC_RC32MCREF_bm) {
    //   DFLLRC32M.CTRL |= DFLL_ENABLE_bm;
    // }
  }

  //
  // This will lock the configuration until the next reset, or until the
  // External Oscillator Failure Detections (XOSCFD) feature detects a failure
  // and switches to internal 2MHz RC oscillator.
  //
  lockConfiguration() {
    ccpWrite(CCPReg.CLKLOCK, +{ CLK_LOCK_bm }+)
  }

  //
  // CCP write helper function written in assembly.
  // This function is written in assembly because of the timecritial operation
  // of writing to the registers.
  //
  ccpWrite(uint8 reg, uint8 value) {
    +{
      uint8_t volatile saved_sreg = SREG; 
      cli();
      volatile uint8_t * address;
      if (reg == `CCPReg.CLKCTRL`)        { address = &CLK.CTRL; }
      else if (reg == `CCPReg.CLKPSCTRL`) { address = &CLK.PSCTRL; }
      else if (reg == `CCPReg.CLKLOCK`)   { address = &CLK.LOCK; }
      else if (reg == `CCPReg.XOSCFAIL`)  { address = &OSC.XOSCFAIL; }    
      volatile uint8_t * tmpAddr = address;
      #ifdef RAMPZ
        RAMPZ = 0;
      #endif
        asm volatile(
          "movw r30,  %0"       "\n\t"
          "ldi  r16,  %2"       "\n\t"
          "out   %3, r16"       "\n\t"
          "st     Z,  %1"       "\n\t"
          :
          : "r" (tmpAddr), "r" (value), "M" (CCP_IOREG_gc), "i" (&CCP)
          : "r16", "r30", "r31"
          );
      SREG = saved_sreg;
    }+
  }

}