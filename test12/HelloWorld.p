import EventHandler as Handler
import Event{uint8} // default meta parameter type is uint8

// TEST  'Any' instantiation (deferred instantiation)

module HelloWorld  implements Handler {

  new Event e1(handle, 1)   // handle is function reference
  new Event e2(handle, 2)

  bool start (Event e) {
    return true;
  }

  pollen.run() {
        
    start(e1 )
    start(e2)
  }
  public handle(uint8 y) { 
    uint8 x = 3
  }   
} 
