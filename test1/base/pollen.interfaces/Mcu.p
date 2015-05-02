package pollen.interfaces

!----

----!

protocol Mcu {

    reset()			# Called on power up and reset 
    
    shutdown()		# Called on shutdown
    
    wait(uint32 us)	# Microsecond delay
    
    nop()			# Single cycle delay
    
	#host uint32 getSystemFrequency()
	
	uint32 getSystemFrequency()
	
	#host setSystemFrequency(uint32 hz)
	
	setSystemFrequency(uint32 hz)
	
}
