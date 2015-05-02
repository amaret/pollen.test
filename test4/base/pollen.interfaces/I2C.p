package pollen.interfaces

----
Standard Inter-Integrated Circuit (I2C) Serial Bus Driver Interface
----

protocol I2C {

	enableAsMaster()
	
	enableAsSlave()
	
	# read a single byte from the bus. If ack is true, an ack will be sent. 
	# returns byte read.
	uint8 get( bool ack )
	
	# write a single byte to the bus. Returns error codes: 0, no error. 
	# 1, error while transmitting 
	uint8 put( uint8 data )
	
	# sends a start condition, an address of a client and true if writing to or 
	# false if reading from a client on the bus.
	uint8 start( uint8 address, bool write )

	# send a stop condition on the bus
	stop()
	
}