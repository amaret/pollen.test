package pollen.interfaces
import GlobalInterruptsBase
----
Global Interrupts interface
----

protocol GlobalInterrupts extends GlobalInterruptsBase {

    
    bool disable()
    
    enable()
    
}
