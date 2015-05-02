from pollen.interfaces import TimerDriver
from pollen.interfaces import Uart
from pollen.interfaces import Gpio

module SoftwareUart implements Uart {

	host TimerDriver Timer = 0
	host Gpio RxPin = 0
	host Gpio TxPin = 0

   	uint32 baudRate = 9600
	host uint8 dataBits = 8
	host uint8 stopBits = 1
	host uint8 parity = 0	
	host uint8 baudh
	host uint8 baudl
    
    SoftwareUart() {
    
    }
    
    host bindInterfaces (TimerDriver TD, Gpio Rx, Gpio, Tx) {
    	Timer := TD
    	RxPin := Rx
    	TxPin := Tx
    }
    
    public put( uint8 data ) {
    
    }
    
    public uint8 get() {
    
    }
    
    public flush() {
    }

    public setBaud( uint32 baud ) {
    
    }
}
