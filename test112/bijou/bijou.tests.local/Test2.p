
from bijou.parts import Color
from pollen.data import Queue{Color} as ColorQueue

module Test2 {

  +{ #include <stdio.h> }+

  host ColorQueue queue = new ColorQueue(10)
  host Color colr = new Color(0, 0, 0, 0)

  pollen.run() {  
    uint8 rgb[3] = {0, 0, 0}

    for (uint8 j =0; j < 10; j++) {
      colr.setRGB(j, j, j)
      queue.add(colr)
    }

    uint8 len = queue.getLength()
   +{ printf("Queue length is: %d!\n", `len`); }+

    while(!queue.isEmpty()) {
      Color c = queue.remove()
      c.getRGB(rgb)
      +{ printf("R=%d, G=%d, B=%d\n", rgb[0], rgb[1], rgb[2]); }+
    }
  }

  pollen.shutdown(uint8 id) {

  }
}
