import Y
import EventHandler{uint8} as Handler
import Event{uint8} // default meta parameter type is uint8

// TEST use implements incorrectly: error 

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
  public handle(Y id) { // cause implements error message
    uint8 x = 3
  }   
} 
