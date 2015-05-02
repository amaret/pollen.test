import pollen.environment as Env 
from Env import Print

from pollen.time import Timer
from pollen.event import HandlerProtocol as HP 

module Test_19 {
  
  host Timer t1

  host Test_19() {
    t1 = new Timer(tick)
  }

  tick() {
    Print.printStr("TICK!\n")
  }

  pollen.run() {
    +{printf("virtual_Test_19_t1__V addr=0x%x\n", &virtual_Test_19_t1__V) }+
    +{printf("callback addr = 0x%x\n", &virtual_Test_19_tick__I)}+
    +{printf("callback addr2 = 0x%x\n", &(virtual_Test_19_t1__V.tickEvent)}+
    t1.startup(tick)

    //t1.start(10, false)    // fire once in 250ms
    // Print.printStr("Run!\n")
    //Env.Newsroom.run()  // start the event system

  }

  pollen.shutdown(uint8 id) {
    Print.printStr("Shutdown!\n")
  }

}
