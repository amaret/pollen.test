from pollen.interfaces import Gpio as LedPin
meta {bool isActiveLow = true, type Z} 

# TEST 'provided' with type name and constants

module Led {
    #host Gpio LedPin
    Led() {
        provided (Z == "Y") {
          Z.set()
        } else {
          LedPin.makeOutput()
        }
    }   
    public on() {
        string n = pollen.unitname
        // NOTE 'provided' is meta syntax only
        provided (isActiveLow == false) { 
            LedPin.set()
        } else {
            LedPin.clear()
        }   
    }   
}
