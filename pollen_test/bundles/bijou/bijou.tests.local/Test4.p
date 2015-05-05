import pollen.environment as Localhost

from pollen.event import Event
from pollen.time import Timer
from bijou.parts import Color
from pollen.data import Queue{Color} as ColorQueue

module Test4 {

  +{ #include <stdio.h> }+

  host Event testEvent = new Event(projectorTick)

  host Timer projectorTimer = new Timer(projectorTick)
  host Timer addTimer = new Timer(addColor)
  host ColorQueue queue = new ColorQueue(10)

  host Color colr = new Color(0, 0, 0, 0)

  pollen.reset() {
    Localhost.reset()
  }

  pollen.run() {  

    uint8 len = queue.getLength()
    +{ printf("Queue length is: %d!\n", `len`); }+
   // addColor()
    addTimer.start(1000, true)   
    projectorTimer.start(2, true)      // this gives a 'frame rate' of 50 FPS
    testEvent.post()
    Localhost.run()
  }

  addColor() {
    uint8 len = queue.getLength()

    if (len == 0) {
      +{ printf("\nAdding 10 more colors, queue length before is %d\n", `len`) }+
      for (uint8 j =0; j < 10; j++) {
        colr.setRGB(j, j, j)
        queue.add(colr)
      }
      len = queue.getLength()
      +{ printf("Now its length is %d\n", `len`) }+      
    }

//    testEvent.post()
  }

  projectorTick() {
    uint8 rgb[3] = {0, 0, 0}

    if(!queue.isEmpty()) {
      Color c = queue.remove()
      c.getRGB(rgb)
      +{ printf("Queue R=%d, G=%d, B=%d\n", rgb[0], rgb[1], rgb[2]); }+    
    } 
//    testEvent.post()
  }


  pollen.shutdown() {
    // provided so program ends after run(). 
  }
}