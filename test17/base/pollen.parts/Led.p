
from pollen.interfaces import Gpio as GpioI

meta {bool isActiveLow = true}

module Led {

    host GpioI Gpio
    
    Led() {
        Gpio.clear()
        Gpio.makeOutput()
    }
    
    public host bindPin(GpioI p) {
        Gpio := p
    }
    
    public toggle() { Gpio.toggle() }
    
    public on() { 
        provided (isActiveLow == false) {
            Gpio.set() 
        } else {
            Gpio.clear()
        }
    }

    public off() { 
        provided (isActiveLow == false) {
            Gpio.clear()
        } else {
            Gpio.set()
        }
    }
    
    public bool isOn() { 
        provided (isActiveLow == false) {
            return Gpio.get() == false
        } else {
            return Gpio.get() == true
        }
    }

}
