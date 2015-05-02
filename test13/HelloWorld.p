import YEnum
import EventHandler{Event} as Handler
import Event{false} // default meta parameter type is uint8

// TEST  'Any' instantiation (deferred instantiation)

module HelloWorld  implements Handler {

  new Event e1(handle, 1)   // handle is function reference
  new Event e2(handle, 2)
  enum ClockSource {SCLK=2, ACLK=7}

  bool start (Event e) {
    return true;
  }

  pollen.run() {
        
    start(e1 )
    start(e2)
  }
  host test() {
    uint8 x = ClockSource.SCLK
    uint8 z = YEnum.Y1
  }
  public handle(Event y) { 

    uint8 x = ClockSource.SCLK
    uint8 z = YEnum.Y1

  }   
} 
