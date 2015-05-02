from mcu.ti.msp430g2231.McuLayout import Mcu
from mcu.ti.msp430g2231.McuLayout import P1_0 as Pin
from mcu.ti.msp430g2231.McuLayout import Wait
from pollen.interfaces import Gpio

module Led {

    host Gpio LedPin
    
    public host bindPin(Gpio p) {
        LedPin = p
    }
    
    public toggle() { LedPin.toggle() }
    
    public on() { LedPin.set() }

    public off() { LedPin.clear() }
    
    public bool isOn() { return LedPin.get() }

    pollen.run() {
        Mcu.reset()
        LedPin.clear()
        LedPin.makeOutput()
    
        while (true) {
            LedPin.toggle()
            Wait.us(500000)
        }
    }
    
    host Led() {
    	bindPin(Pin)
    }

}