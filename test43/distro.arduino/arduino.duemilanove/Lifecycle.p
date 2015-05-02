package arduino.duemilanove

from pollen.hardware import Environment

import Environment as Env
from Environment import Mcu

module Lifecycle {

  Environment environment      # Protocol member for the Environment composition

  pollen.reset() {
    Mcu.reset() 
    
    environment.Mcu.reset()
    environment.Digital13.clear()
    environment.Digital13.makeOutput()
  }
  
  pollen.ready() {    
    # Blink the Led twice
    for (uint8 i = 0; i < 3; i++) {
      environment.Digital13.toggle()    

      for (uint8 j = 0; i < 50; i++) {
        environment.wait(1000)
      }
    }
  }
  
  pollen.shutdown(uint8 id) {
  
  }

  !--   
  
  pollen.hibernate(uint8 id) {
  
  }
  
  pollen.wake(uint8 id) {
  
  }
  
  pollen.new( .. ) {
  
  }
  
  pollen.delete( ... ) {
  
  
  }
  
  pollen.print( ... ) 
  
  --!
  
}