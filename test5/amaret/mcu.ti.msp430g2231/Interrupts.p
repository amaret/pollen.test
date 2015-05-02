package mcu.ti.msp430g2231

from mcu.ti.msp430 import InterruptMeta{} as GpioP1
from mcu.ti.msp430 import InterruptMeta{} as GpioP2

composition Interrupts {

	export GpioP1
	export GpioP2
	
}