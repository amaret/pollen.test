package arduino.environments

from pollen.hardware import Environment

module Lifecycle {

  Environment Env       # Protocol member for the Environment composition

  pollen.reset() {
    Env.Mcu.reset()
    Env.Digital13.clear()
    Env.Digital13.makeOutput()
  }
  
  pollen.ready() {    
    # Blink the Led twice
    for (uint8 i = 0; i < 3; i++) {
      Env.Digital13.toggle()    

      for (uint8 j = 0; i < 50; i++) {
        Env.wait(1000)
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