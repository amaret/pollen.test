
import pollen.environment as Bijou

from bijou.parts import LedState
from pollen.time import Timer
from pollen.math import Math


module ColorBlink {

  host Timer delayTime = new Timer(delayDone)
  host Timer blinkTime = new Timer(blink)

  host LedState led = new LedState(0)
  const uint8 BlinkSpeed = 20
  const uint8 NumBlinks = 3

  uint8 toggleCount = 0

  pollen.run() {
    led.setRGBA(255, 0, 255, 255)
    delayTime.oneshot(100)
    Bijou.run()
  }  

  delayDone() {
    uint8 r = Math.rand8()
    uint8 g = Math.rand8()
    uint8 b = Math.rand8()
    led.setRGB(r, g, b)
    blink()
  }


  blink() {
    if (toggleCount < (NumBlinks * 2)) {
      if (led.getAlpha()) {
        led.setAlpha(0).apply()
      } else {
        led.setAlpha(255).apply()
      }            

      toggleCount++
      blinkTime.oneshot(BlinkSpeed)
    } else {
      toggleCount = 0
      //delayTime.oneshot(100)
      uint8 r = Math.rand8()
      uint8 g = Math.rand8()
      uint8 b = Math.rand8()
      led.setRGB(r, g, b)
      blinkTime.oneshot(BlinkSpeed)
    }
  }


}

