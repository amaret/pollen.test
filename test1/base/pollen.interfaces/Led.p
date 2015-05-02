package pollen.interfaces

protocol Led {

	on()			# Turn Led On
	
	off()			# Turn Led Off
	
	toggle()		# Toggle Led State
	
	bool isOn()		# Check if Led is On
}

