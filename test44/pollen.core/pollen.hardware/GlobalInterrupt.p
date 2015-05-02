package pollen.hardware

protocol GlobalInterrupt {

  !--
    Disable global interrupts, return true if they were enabled
  --!
  bool disable()        

  !--
    Enable global interrupts
  --!
  enable()

  !--
    Restore global interrupts to given state
  --!
  restore(bool state) 
  
}
