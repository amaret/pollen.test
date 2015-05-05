
import USBInternals

module USB {

  public configureClock() {
    +{ USB_ConfigureClock() }+
  }

  public enableInterrupts() {
    // Enable USB interrupts
    +{ USB.INTCTRLA = /*USB_SOFIE_bm |*/ USB_BUSEVIE_bm | USB_INTLVL_MED_gc; }+
    +{ USB.INTCTRLB = USB_TRNIE_bm | USB_SETUPIE_bm; }+
  }

  public init() {
    +{ USB_Init() }+
  }

}