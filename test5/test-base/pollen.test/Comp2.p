
from mcu.ti.msp430g2231.McuLayout import Mcu
from mcu.ti.msp430g2231.McuLayout import P1_0
from mcu.ti.msp430g2231.McuLayout import Wait

import Led

composition Comp2 {

    export Mcu
    export P1_0 
    export Wait
    export Mcu.reset
    export Wait.us
    export P1_0.clear
    export P1_0.makeOutput
    export P1_0.toggle
}