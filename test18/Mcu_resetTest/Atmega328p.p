
module Atmega328p {

	public reset() {
	}

	public wait(uint32 us) {
	}
	public host uint32 getSystemFrequency() { 
		return @sysFreq 
	}
	
	public host setSystemFrequency(uint32 hz) {
		@sysFreq = hz
	}
	
	public setSystemFrequency(uint32 hz) {
		@sysFreq = hz
	}


	#==================================
	# Private data members 
	#==================================
	uint32 sysFreq

}
