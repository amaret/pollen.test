package pollen.interfaces


protocol Uart {

	#host config(uint32 baudRate, uint8 dataBits, uint8 stopBits, uint8 parity)
    
    put( uint8 data )
    
    uint8 get()
    
    flush()

    setBaud( uint32 baud )

}
