package mcu.localhost

----

Global Interrupts module for your desktop host.

----

from pollen.interfaces import GlobalInterrupts as GI

module GlobalInterrupts implements GI {

	public bool disable() {
		return false
	}
    
    public enable() {

    }
    
    public restore( bool state ) {

    }
}