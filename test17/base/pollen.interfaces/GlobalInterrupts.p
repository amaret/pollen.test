package pollen.interfaces

----
Global Interrupts interface
----

protocol GlobalInterrupts {

    
    # Disable global interrupts returning their present state,
    # 	true = enabled, false = disabled
    
    bool disable()
    
    
    # Enable global interrupts.

    enable()
    

	# Restore global interrupts to the given state (true = on, false = off)
	
    restore( bool state )
    
}
