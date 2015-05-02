package virtual.mcu

from pollen.hardware import GlobalInterruptsProtocol

module GlobalInterrupts implements GlobalInterruptsProtocol {
  +{ #include <stdio.h> }+
  
  public enable() {
    +{ printf("GlobalInterrupts enable\n") }+
  }

  public disable() {
    +{ printf("GlobalInterrupts disable\n") }+
  }
}
