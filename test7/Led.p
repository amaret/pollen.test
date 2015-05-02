import Y as Z
from pollen.interfaces import Gpio as LedPin
meta {uint8 isActiveLow = 3, uint8 newNum = 2} 

module Led {
    #host Gpio LedPin
    Led() {
        provided (newNum != 2) {
          Z.set()
        } else {
          LedPin.makeOutput()
        }
    }   
    public on() {
        // NOTE 'provided' is meta syntax only
        provided (isActiveLow == 1) { 
            LedPin.set()
        } else {
            LedPin.clear()
        }   
    }   
}
