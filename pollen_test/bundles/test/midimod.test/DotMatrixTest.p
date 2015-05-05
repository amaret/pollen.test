import pollen.environment as Env

import DotMatrix

module DotMatrixTest {
  
  host DotMatrixTest() {
    DotMatrix.setDimensionsOnHost(6, 8)
  }

  pollen.run() {
    uint8 i 

    for (i = 0; i < 6; i++) {
      DotMatrix.setDot(i, 4)
    }
    DotMatrix.update()

    for (i = 0; i < 6; i++) {
      DotMatrix.clearDot(i, 4)
    }
    DotMatrix.update()    

  }

  pollen.shutdown() {
    print "DotMatrix goodbye\n"
  }

}