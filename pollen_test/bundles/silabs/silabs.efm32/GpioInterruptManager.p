from pollen.hardware import HandlerProtocol as Handler


module GpioInterruptManager {
  
  host Handler.handler() handlers[16] = { null }

  public addHandler(uint8 pin, Handler.handler h) {
    handlers[pin] = h
  }

  public removeHandler(uint8 pin) {
    handlers[pin] = null
  }

  public enable() {
   +{
      GPIO_IntConfig(`port`,  `pin`, false, true, true); 
      NVIC_ClearPendingIRQ(GPIO_EVEN_IRQn);
      NVIC_EnableIRQ(GPIO_EVEN_IRQn);
    }+
  }


  +{
    void GPIO_EVEN_IRQHandler(void)
    {
      uint32 iflags;
      iflags = GPIO_IntGetEnabled() & 0x00005555;     // Get all even interrupts.
      GPIO_IntClear(iflags);                        // Clean only even interrupts.
      `pressHandler`(iflags);
    }

    void GPIO_ODD_IRQHandler(void)
    {
      uint32 iflags;
      iflags = GPIO_IntGetEnabled() & 0x0000AAAA;     // Get all even interrupts.
      GPIO_IntClear(iflags);                        // Clean only even interrupts.
      `pressHandler`(iflags);
    }
  }+

}