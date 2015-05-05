

from pollen.hardware import HandlerProtocol as HP
from pollen.data import HandlerQueue
from virtual.mcu import ConsolePrint as Console

module Test_08 {
  
  host new HandlerQueue handlers(5)
  HP.handler() h

  pollen.run() {

     handlers.add(tick5)
     handlers.add(tick4)
     handlers.add(tick3)
     handlers.add(tick2)
     handlers.add(tick1)        

     while(!handlers.isEmpty()) {
       h = handlers.remove()

       if (h != null) {
         h()
       }
     }
        
  }

  tick1() {
    Console.printStr("TICK 1\n")    
  }

  tick2() {
    Console.printStr("TICK 2\n")    
  }

  tick3() {
    Console.printStr("TICK 3\n")    
  }

  tick4() {
    Console.printStr("TICK 4\n")    
  }

  tick5() {
    Console.printStr("TICK 5\n")    
  }

  pollen.shutdown() {

  }
}
