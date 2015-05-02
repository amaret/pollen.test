package pollen.interfaces

----
Global Interrupts BASE interface
----

protocol GlobalInterruptsBase {


    # Restore global interrupts to the given state (true = on, false = off)
	
    restore( bool state )
    
}
