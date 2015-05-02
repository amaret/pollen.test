import pollen.environment as Bijou

from bijou.parts import ColorLed

module PwmTest4 {

  host PwmTest4() {
    ColorLed.Red := Bijou.Led0
    ColorLed.Green := Bijou.Led1
    ColorLed.Blue := Bijou.Led2
  }

  pollen.reset() {
    Bijou.reset()
  }  

  pollen.run() {
    uint8 i, j, k

    while (true) {
      i = j = k = 0

      for (i = 0; i < 255; i++) {
        ColorLed.setRGBA(i, j, k, 0)
        delay()
      }

      for (j = 0; j < 255; j++) {
        ColorLed.setRGBA(i, j, k, 0)
        delay()
      }

      for (k = 0; k < 255; k++) {
        ColorLed.setRGBA(i, j, k, 0)
        delay()
      }

      for (i = 255; i > 0; i--) {
        ColorLed.setRGBA(i, i, i, 0)
        delay()
      }
    }
  }

  delay() { 
    volatile uint16 i = 0
    for (i = 0; i < 5; ++i) {
      Bijou.wait(100)
    }
  }

}