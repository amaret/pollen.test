
from atmel.xmega import ATxmega16C4 as Mcu
from Mcu import Cpu

module MidiModBoard {
  
  public reset() {

    // Start the PLL to multiply the internal 2MHz oscillator to 32MHz and switch the CPU to run from it
    Cpu.startPLL(0x01, 2000000, 32000000) // the 0x01 is for ClockSource.INTERNAL_2M but enums are broken
    Cpu.selectCpuClockSource(0x10)        // the 0x10 is for ClockSource.PLL but enums are broken

    // Start the 32MHz internal oscillator and start the DFLL to increase to 48MHz using the USB SOF as a reference
    // XMEGACLK_StartInternalOscillator(CLOCK_SRC_INT_RC32MHZ);
    // XMEGACLK_StartDFLL(CLOCK_SRC_INT_RC32MHZ, DFLL_REF_INT_USBSOF, F_USB);
  }

  public ready() {
    // blink the system led twice to show we're alive..
  }

  public shutdown() {

  }

  public hibernate(byte id) {

  }

  public wake(byte id) {

  }


}