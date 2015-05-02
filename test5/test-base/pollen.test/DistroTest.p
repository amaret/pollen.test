from distro.ti.launchpad import Distro
from Distro import Mcu
from Distro import Pin
from Distro import Wait

module DistroTest {

    pollen.run() {
        Mcu.reset()
        Pin.makeOutput()
        
        while(true) {
            Pin.toggle()
            Wait.us(500000)
        }
    }
}