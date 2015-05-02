# Test_08
# TEST dispatch / event functionality.
# TEST Runnable test

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

       print "In remove while loop\n"

       if (h != null) {
         h()
       }
     }
        
  }

  tick1() {
    print "TICK 1\n"    
  }

  tick2() {
    print "TICK 2\n"    
  }

  tick3() {
    print "TICK 3\n"    
  }

  tick4() {
    print "TICK 4\n"    
  }

  tick5() {
    print "TICK 5\n"    
  }

  pollen.shutdown(uint8 id) {

  }
}
