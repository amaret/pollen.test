package distro.ti.launchpad

from Board import Mcu
from Board import Pin0
from Mcu import GlobalInterrupts

from pollen.events import Events
from pollen.time import Time

composition Distro {

    export Mcu
    export Pin0
                    
    host Distro() {
        Events.bindGlobalInterrupts(GlobalInterrupts)
    }
}
