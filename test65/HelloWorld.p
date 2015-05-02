import EventHandler{uint8} as Handler
import Event{uint8} 

module HelloWorld  implements Handler {

  host new Event e1(handle, 1)   

  bool start (Event e) {
    return true;
  }

  pollen.run() {
    start(e1 )
  }

  public handle(Event e1) {
  }
} 
