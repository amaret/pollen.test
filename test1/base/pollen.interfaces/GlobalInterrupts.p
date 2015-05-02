package pollen.interfaces

!----
  Global Interrupts interface
----!
import GlobalInterruptsBase
protocol GlobalInterrupts extends GlobalInterruptsBase {

    
    # Disable global interrupts returning their present state,
    # 	true = enabled, false = disabled
    
    bool disable()
    
    
    # Enable global interrupts.

    enable()
    
}
