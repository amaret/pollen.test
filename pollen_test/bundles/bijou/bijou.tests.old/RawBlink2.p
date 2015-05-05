from bijou.boards import BijouOneLed as Bijou
from Bijou import RgbLed

module RawBlink2 {

  RawBlink2() { !-- RgbLed starts with all LEDs off by default --! }

  pollen.reset() {
    Bijou.reset()        
  }
  
  pollen.run() {
    while(true) {    

      RgbLed.redOn()
      RgbLed.greenOff()
      RgbLed.blueOff()
      delay()

      RgbLed.redOff()
      RgbLed.greenOn()
      RgbLed.blueOff()
      delay()

      RgbLed.redOff()
      RgbLed.greenOff()
      RgbLed.blueOn()
      delay()

      RgbLed.redOn()
      RgbLed.greenOn()
      RgbLed.blueOff()
      delay()

      RgbLed.redOn()
      RgbLed.greenOff()
      RgbLed.blueOn()
      delay()

      RgbLed.redOff()
      RgbLed.greenOn()
      RgbLed.blueOn()
      delay()

      RgbLed.redOn()
      RgbLed.greenOn()
      RgbLed.blueOn()
      delay()

    }
  }

  delay() { 
    for (uint16 i = 0; i < 500; ++i) {
      Bijou.wait(550)
    }
  }

}