import Event
import Queue as queue
module Test {

  +{ #include <stdio.h> }+

  host Event ev = new Event()

  pollen.run() {  
    for (uint8 j =0; j < 10; j++) {
      queue.add(ev)
    }

    uint8 len = queue.getLength()
   +{ printf("Queue length is: %d!\n", `len`); }+

  }


  loop() {

    if(!queue.isEmpty()) {
      Event e = queue.remove()
    } 

    if (!queue.isEmpty()) {
      queue.add(ev) // repost the event so the loop runs again
    }
  }


  pollen.shutdown(uint8 id) {
    // provided so program ends after run(). 
  }
}
