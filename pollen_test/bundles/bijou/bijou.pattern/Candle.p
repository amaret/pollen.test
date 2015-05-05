package bijou.pattern

from bijou.parts import LedState 
from bijou.parts import Scene
from pollen.math import Math
from pollen.time import Timer

module Candle {
  
  host Timer drawTimer = new Timer(draw)
  host LedState led = new LedState(0)
  Scene scene = null
  
  const uint8 MinBrightness = 40  //10
  const uint8 MaxBrightness = 90 //100  
  const uint8 MinDelay = 5      //10
  const uint8 MaxDelay = 30     //80
  const bool doWalk = true

  uint16 duration = 0
  uint16 br = 0

  Candle() {
    led.setRGB(255, 255, 255)
  }

  public start(Scene s) {
    @scene = s     
    @duration = scene.getDuration()       // There is a bug here, I cannot do @duration = @scene.getDuration()

    if (duration < 100) {
      duration = 100
    }

    duration -= 15
    drawTimer.oneshot(15)
  }
  
  public stop() {
    drawTimer.stop()
    @scene.stopped()
  }

  public setRGB(uint8 red, uint8 green, uint8 blue) {
    led.setRGB(red, green, blue)
  }

  //---------------------------------------------------------------------------
  // The draw tick 
  //---------------------------------------------------------------------------

  draw() {
    uint8 v = Math.map8(Math.rand8(), 0, 255, MinBrightness, MaxBrightness)

    if (doWalk) {
      walk(v)
    } else {
      br = v
      led.setAlpha(br).apply()
    }

    uint8 d = Math.map8(Math.rand8(), 0, 255, MinDelay, MaxDelay)
    if (duration > d) {
      drawTimer.oneshot(d)
      duration -= d
    } else {
      @stop()
    }
  }

  walk(uint8 val) {
    if (val > br) {
      while (++br < val) {
        led.setAlpha(br).apply()
      }
    } elif (val < br) {
      while (--br > val) {
        led.setAlpha(br).apply()
      }
    }
  }

}