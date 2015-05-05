from pollen.hardware import GlobalInterruptsProtocol

module GlobalInterrupts implements GlobalInterruptsProtocol {
  
  +{
      #ifndef __EFM32_INT__
      #define __EFM32_INT__
        #include "em_int.c"
      #endif
  }+

  bool enabled = false

  public disable() {            // Disable gloabl interrupts
    +{ INT_Disable(); }+
    enabled = false
  }

  public enable() {             // Enable global interrupts
    +{ INT_Enable(); }+
    enabled = true
  }

  public restore(bool state) {  // Restore global interrupts to state
    if (state) { enable() }
    else { disable() }
  }

  public bool isEnabled() {
    return enabled
  }

}