package pollen.hardware

!---------------------------------------------------------------------
  Protocol definition for the microcontroller global interrupts.
----------------------------------------------------------------------!

protocol GlobalInterruptsProtocol {
    
  disable()             // Disable gloabl interrupts
  enable()              // Enable global interrupts
  restore(bool state)   // Restore global interrupts to state
  bool isEnabled()

}