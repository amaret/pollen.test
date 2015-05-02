import pollen.environment as Bijou

from Bijou import Led0
from Bijou import Led1
from Bijou import Led2

from bijou.parts import ColorLed
from pollen.time import Timer

module PwmTest00 {

  host Timer t1 = new Timer(tick)
  uint8 count = 0
  bool dirUp = true

  host PwmTest0() {
    ColorLed.Red := Led0
    ColorLed.Green := Led1
    ColorLed.Blue := Led2
  }

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    t1.start(2, true)
    Bijou.run()
  }

  tick() {
    if (dirUp) {
      count++
      if (count == 255) { dirUp = false }
    } else {
      count--
      if (count == 0) { dirUp = true }
    }

    ColorLed.setRGB(count, count, count)
  }  
}