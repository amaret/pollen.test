import pollen.environment as Bijou


from pollen.hardware import PinProtocol
from pollen.hardware import HandlerProtocol as HP
from pollen.time import Timer
from pollen.event import Event

module Button {

  host PinProtocol pin

  host new Timer dbTimer(debounce)
  host new Timer dblClickTimer(checkDoubleClick)

  host uint8 pressDebounce = 10         // milliseconds
  host uint8 dblClickDelay = 700        // milliseconds
  host Event onClick  = new Event(null)
  host Event dblClick = new Event(null)
  volatile uint8 clickCount = 0

  Button() {
    pin.clear()
    pin.makeInput()

   +{
      GPIO_IntConfig(gpioPortB,  10, false, true, true); 
      NVIC_ClearPendingIRQ(GPIO_EVEN_IRQn);
      NVIC_EnableIRQ(GPIO_EVEN_IRQn);
    }+
  }

  public host setClickHandlerOnHost(HP.handler h) {
    onClick.setHandlerOnHost(h)
  }

  public host setDoubleClickHandlerOnHost(HP.handler h) {
    dblClick.setHandlerOnHost(h)
  }

  pressHandler(uint32 pin) {
    if (pin.get() == false) {           // active low ON!
      dbTimer.oneshot(pressDebounce)     // start debounce timer 
    }
  }

  debounce() {
    if (pin.get() == false) {           // if button still pressed - ACTIVE LOW
      if (++clickCount == 1) {
        dblClickTimer.oneshot(dblClickDelay)
      }
      onClick.post()                          // post the event...      
    }
  }

  checkDoubleClick() {
    if (clickCount >= 2) {
      dblClick.post()     
    }
    clickCount = 0
  }

  +{
    void GPIO_EVEN_IRQHandler(void)
    {
      uint32 iflags;
      iflags = GPIO_IntGetEnabled() & 0x00005555;     // Get all even interrupts.
      GPIO_IntClear(iflags);                        // Clean only even interrupts.
      `pressHandler`(iflags);
    }
  }+


}
