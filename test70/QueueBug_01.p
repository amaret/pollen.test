# TEST this test originally tried to use Protocol1.FcnRef as a type argument for a meta type.
# TEST Replaced with Protocol1 as the type argument and it works.

from pollen.hardware import HandlerProtocol as HP
//from pollen.data import Queue {HP.handler} as HandlerQueue
from pollen.data import Queue {HP} as HandlerQueue
//from pollen.data import Queue {HandlerProtocol} as HandlerQueue
from virtual.mcu import ConsolePrint as Console

module QueueBug_01 {
  
  host new HandlerQueue eventHandlers(5)

  host QueueBug_01() {
  }

  HP.handler() h = null

  pollen.run() {

    eventHandlers.add(tick5)
    eventHandlers.add(tick4)
    eventHandlers.add(tick3)
    eventHandlers.add(tick2)
    eventHandlers.add(tick1)


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
  pollen.shutdown(uint8 id) {}

}
