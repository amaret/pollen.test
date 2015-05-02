package mcu.localhost

from pollen.interfaces import Wait as WaitI

module Wait implements WaitI {

	 

	public us( uint32 microseconds ) {
		+{ usleep(microseconds) }+
	}
}
