from arduino.uno import Environment 
from Environment import Led
from Environment import Mcu

# TEST Multiple exported function qualifications
# TEST (composition, module, full, none).
# TEST Failure with no qualification

module BlinkEnvLed {
  
  pollen.reset() {
  }
  
  pollen.run() {
    uint16 i
  
    while(true) {
      Led.toggle()
      
      for (i = 0; i < 50; i++) {
        Environment.Mcu.wait(1000) // full qualification works

        Environment.wait(1000) // composition qualification works

        Mcu.wait(1000)  // module qualification works
         
        wait(1000) // does not resolve
        
      }
    }
  }
}
