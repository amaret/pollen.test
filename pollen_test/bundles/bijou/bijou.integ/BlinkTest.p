import pollen.environment as Bijou

from Bijou import Led0


module BlinkTest {
  
  pollen.reset() {
    Bijou.reset()    
  }

  pollen.run() {

    while(true) {
      Led0.toggle()
       delay()
    }
  }


  delay() {
    volatile uint32 i = 0

    for (i = 0; i < 500000; ) {
      i++
    }
  }

}