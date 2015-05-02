from arduino.uno import Environment
# withoout following import 'Mcu.wait' is not found
# TEST access through composition exports
from Environment import Mcu
from DigitalPin import Digital13 

module BlinkEnvPin {
  
  pollen.reset() {
    Digital13.clear()
    #Pin.makeOutput()
  }
  
  pollen.run() {
    uint16 i
  
    while(true) {
      Digital13.toggle()
      
      for (i = 0; i < 250; i++) {
        //Core.wait(1000)   doesn't resolve
        //Environment.wait(1000)   doesn't resolve
        Mcu.wait(1000)
      }
    }
  }
}
