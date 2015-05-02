from pollen.interfaces import Gpio

from mcu.atmel.atmega328p import PD5

module FancyPD5 implements Gpio {
    
 
    public bool get() { 
    
        # do my own stuff
        
        x = PD5.get()
        
        # do something with x
            
        return x
    }
        
}