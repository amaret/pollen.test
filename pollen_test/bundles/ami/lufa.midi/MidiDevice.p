
import AppDefines

from lufa.usb import USB
from lufa.usb.xmega import XmegaUtil    // will be rolled into Cpu & other modules.

import Descriptors
import USBEvents

module MidiDevice {
  
  // Configures the hardware and peripherals
  pollen.reset() {
   +{
      /* Start the PLL to multiply the 2MHz RC oscillator to 32MHz and switch the CPU core to run from it */
      XMEGACLK_StartPLL(CLOCK_SRC_INT_RC2MHZ, 2000000, F_CPU);
      XMEGACLK_SetCPUClockSource(CLOCK_SRC_PLL);

      /* Start the 32MHz internal RC oscillator and start the DFLL to increase it to 48MHz using the USB SOF as a reference */
      XMEGACLK_StartInternalOscillator(CLOCK_SRC_INT_RC32MHZ);
      XMEGACLK_StartDFLL(CLOCK_SRC_INT_RC32MHZ, DFLL_REF_INT_USBSOF, F_USB);
    }+
  }

  // Main program entry point. This routine configures the hardware required by the application, then
  // enters a loop to run the application tasks in sequence.
  //
  pollen.run() {

    // enable all interrupt levels
    +{ PMIC.CTRL = PMIC_LOLVLEN_bm | PMIC_MEDLVLEN_bm | PMIC_HILVLEN_bm; }+

    // Initialize LEDs
    USB.init()

    // enable global interrupts
    //Env.GlobalInterrupts.enable()
    +{ GlobalInterruptEnable() }+

    while(true) {
      USBEvents.doMidiTask()
      USB.doUSBTask()
    }

  }

}