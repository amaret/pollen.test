

import pollen.environment as Env

from Env import Led0
from Env import Led1
from Env import Led2
from Env import ButtonPin

from pollen.time import Timer
from pollen.event import Event


module ButtonTest00 {
  
//  host Timer tickTimer = new Timer(tick)
  host Timer dbTimer = new Timer(debounce)
  host Event event1 = new Event(handler)

  +{
    void GPIO_EVEN_IRQHandler(void)
    {
      uint32 iflags;
      iflags = GPIO_IntGetEnabled() & 0x00005555;   // Get all even interrupts.
      GPIO_IntClear(iflags);                        // Clean only even interrupts.
      `pressHandler`(iflags);
    }
  }+

  ButtonTest00() {
    ButtonPin.clear()
    ButtonPin.makeInput()
   +{
      GPIO_IntConfig(gpioPortB,  10, false, true, true); 
      NVIC_ClearPendingIRQ(GPIO_EVEN_IRQn);
      NVIC_EnableIRQ(GPIO_EVEN_IRQn);
    }+
  }

  host uint8 pressDebounce = 10

  pollen.reset() {
    Env.reset()
  }

  pollen.run() {

//    tickTimer.start(5000, true)
    Env.run()
  }

  pressHandler(uint32 val) {
    Led0.toggle()    
    dbTimer.start(10, false)    
  }

  debounce() {
    Led1.toggle()
    event1.post()
  }

  tick() {
    //Led1.toggle()
    //event1.post()
    pressHandler(100)
  }

  handler() {
    //Led2.on()
    Led2.toggle()
  }

  pollen.shutdown(uint8 id) {

  }
}
