package pollen.test

----
Blink using a busy wait 
----

#from distro.ti.launchpad import Board
from distro.arduino import Board

from Board import Mcu
from Board import Led

module BlinkLed {

    pollen.reset() {
        Mcu.reset() 
    }

    pollen.run() {
        
        while (true) {

            Led.toggle()
            Mcu.wait(500000)
        }
    }
}
