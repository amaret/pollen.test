package pollen.interfaces

----

----

module Gpio {

    public set() {}	# Set the pin high

    public clear() {}	# Set the pin low

    public toggle() {}	# Toggle the state of the pin

    public bool get() {}	# Get the pin state

    public makeInput() {}	# Make pin an input

    public bool isInput() {}	# Check if pin is configured as an input

    public makeOutput() {}	# Make pin an output

    public bool isOutput() {}	# Check if pin is configured as an output

}
