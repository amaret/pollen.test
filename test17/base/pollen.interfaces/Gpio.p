package pollen.interfaces

----

----

protocol Gpio {

	set()				# Set the pin high

	clear()				# Set the pin low
	
	toggle()			# Toggle the state of the pin
	
	bool get()			# Get the pin state
	
	makeInput()			# Make pin an input
	
	bool isInput()		# Check if pin is configured as an input
	
	makeOutput()		# Make pin an output
	
	bool isOutput()		# Check if pin is configured as an output
	
}