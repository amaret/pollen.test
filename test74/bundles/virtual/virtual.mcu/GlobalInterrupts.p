package virtual.mcu

from pollen.hardware import GlobalInterruptsProtocol

module GlobalInterrupts implements GlobalInterruptsProtocol {
  
  public enable() {
    //+{ printf("+") }+
  }

  public disable() {
    //+{ printf(".") }+
  }
}