
import pollen.environment as Env
from Env import StatusLed
from Env import D2 as MatrixEnable    # active high enable
import BasicTwi as Twi

module MM1 {
  
  MM1() {
    MatrixEnable.makeOutput()    
    MatrixEnable.set()
    Twi.init()
    Env.wait(10000)     // a little delay before TWI     
  }

  pollen.reset() {
    Env.reset()
  }

  pollen.run() {

    while(true) {

      Twi.start(0x60, true) // address slave, specify write

      // Twi.write(address)
      // Twi.write(0x01)     // col 1
      // Twi.write(0x0F)     // red 1, 3, 5, 7
      // Twi.write(0x0C)     // write data to display
      // Twi.stop()
      
      // +{TWIC.MASTER.DATA}+ = 0x01   // col 1
      
      // +{TWIC.MASTER.DATA}+ = 0x03   // red 1, 3, 5, 7
      
      // +{TWIC.MASTER.DATA}+ = 0x04   // col 4
      
      // +{TWIC.MASTER.DATA}+ = 0x00  // red 2, 4, 6, 8
      
      // +{TWIC.MASTER.DATA}+ = 0x0C

      // blink(1)
    }
  }

  blink(uint8 times) {
    for( ; times > 0; times--) {
      StatusLed.on()
      Env.wait(40000)
      Env.wait(40000)
      StatusLed.off()
      Env.wait(40000)
      Env.wait(40000)
    }
  }

}