package distro.ti.launchpad

from mcu.ti.msp430g2231 import Mcu
from Mcu import P1_0 as Pin0

from pollen.parts import Led{false} as Led

composition Board {

	export Mcu
	export Pin0
    export Led
    
    host Board() {
        Led.bindPin(Pin0)
	}

}