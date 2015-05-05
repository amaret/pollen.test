from ti.msp430 import MSP430F2274 as Mcu
from Mcu import P2_0


module MsTest {
  
  MsTest() {
    Mcu.reset()
    P2_0.clear()
    P2_0.makeOutput()
  }

  pollen.run() {

    while(true) {
      uint16 i, j

      P2_0.set()
      for (i = 0; i < 6; i++) {            // 4.16, 5.16, 6.4, 7.68, 8.92
        +{ __asm__ __volatile__ ("nop") }+ // 1, 1.24, 1.28, 1.24, 
      }
      P2_0.clear()
      for (j = 0; j < 6; j++) {            
        +{ __asm__ __volatile__ ("nop") }+ 
      }          
    }

  }

}