package board.ti

from mcu.ti.msp430g2231 import Mcu
from Mcu import P1_0

from pollen.parts import Led{false} as Led

composition LaunchPad {

	export Mcu
    export Led
    
    export P1_0
    
    host LaunchPad() {
        Led.bindPin(P1_0)
	}

}