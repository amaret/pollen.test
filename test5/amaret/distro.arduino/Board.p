package distro.arduino

from mcu.atmel.atmega328p import Mcu


from Mcu import PB4	as D12
from Mcu import PB5 as D13

from Mcu import TimerMilli8BitTimer0 as Timer0
from Mcu import Uart 

from pollen.parts import Led{false} as Led

composition Board {

	export Mcu
	export Timer0
	export Uart
	
    export Led
    
    export D12
    export D13		# Led pin is exposed on arduino
    
	host Board() {
		Mcu.setSystemFrequency(16000000)
        Led.bindPin(D13) #(D12)
	}
}