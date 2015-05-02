package distro.arduino

import Board
from Board import Mcu
from Board import Led
from Board import Pin0
from Board import Timer0
from Board import Uart
from Mcu import GlobalInterrupts

from pollen.events import Events
from pollen.time import Time

composition Distro {

    export Led
    export Mcu
    export Pin0
    export Uart
                    
    host Distro() {
        Events.bindGlobalInterrupts(GlobalInterrupts)
        Time.bindGlobalInterrupts(GlobalInterrupts)
        Time.bindTimerDriver(Timer0)
        Uart.setBaud(57600)
    }
}
