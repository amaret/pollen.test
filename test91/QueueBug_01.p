// Note this test gets errors because it is trying to instantiate Queue with a function ref
// as a type parameter.

from pollen.hardware import HandlerProtocol as HP
from pollen.data import Queue {HP} as HandlerQueue  // Here, the problem
from local.mcu import ConsolePrint as Console

module QueueBug_01 {
  
  host new HandlerQueue eventHandlers(5)

  host QueueBug_01() {
  }

  pollen.run() {
    eventHandlers.add(tick5)
    eventHandlers.add(tick4)
    eventHandlers.add(tick3)
    eventHandlers.add(tick2)
    eventHandlers.add(tick1)

    HP.handler() h

    while (!eventHandlers.isEmpty()) {
      h = eventHandlers.remove()

      if (h != null) {
        h()
      } else {
        Console.printStr("H IS NULL!\n")
      }
    }

  }

  tick1() {
    Console.printStr("TICK1\n")
  }

  tick2() {
    Console.printStr("TICK2\n")    
  }

  tick3() {
    Console.printStr("TICK3\n")    
  }

  tick4() {
    Console.printStr("TICK4\n")    
  }

  tick5() {
    Console.printStr("TICK5\n")    
  }

}
