

from bijou.parts import Scene
from bijou.parts import LedState
from bijou.parts import Projector
from bijou.parts import ColorSpace

from pollen.math import Math
from pollen.time import Timer

module Twinkle {

  const uint8 MinDuration = 15
  host Timer drawTimer = new Timer(draw)
  host Timer stopTimer = new Timer(stop)
  host LedState led = new LedState(0)
  Scene scn = null

  real hsv[3] = {0.0, 0.0, 0.0}

  public start(Scene s) {
    scn = s
    uint32 duration = scn.getDuration()
    
    if (duration < MinDuration) {
      duration = MinDuration
    }

    drawTimer.start(15)
    stopTimer.oneshot(duration)
  }
  
  public stop() {
    drawTimer.stop()
    scn.stopped()
  }

  public setHue(real hue) {
    if (hue >= 0.0 && hue <= 1.0) {
      hsv[0] = hue
    }
  }

  public setSaturation(real sat) {
    if (sat >= 0.0 && sat <= 1.0) {
      hsv[1] = sat
    }
  }

  public setBrightness(real bright) {
    if (bright >= 0.0 && bright <= 1.0) {
      hsv[2] = bright
    }    
  }

  public setHsv(real hue, real sat, real bright) {
    if (hue >= 0.0 && hue <= 1.0) {
      hsv[0] = hue
    }
    if (sat >= 0.0 && sat <= 1.0) {
      hsv[1] = sat
    }
    if (bright >= 0.0 && bright <= 1.0) {
      hsv[2] = bright
    }    
  }

  //---------------------------------------------------------------------------
  // The draw tick - every 15ms here
  //---------------------------------------------------------------------------
  const real HueDist = 0.01
  const real SatDist = 0.13
  const real HueDiv = (65535 / HueDist)    // this divisor makes sure we get a result no bigger than HueDist
  const real SatDiv = (65535 / SatDist)    // this divisor makes sure we get a result no bigger than SatDist
  uint8 rgb[3] = {0}

  draw() {
    real hue = Math.rand16() / HueDiv      
    real sat = Math.rand16() / SatDiv   

    hue = (Math.rand16() % 2) ? hue : -(hue)
    hue += hsv[0]
    if (hue < 0) {
      hue = 0
    }

    sat = (Math.rand16() % 2) ? sat : -(sat)
    sat += hsv[1]
    if (sat < 0) {
      sat = 0
    }

    ColorSpace.hsvToRgb(hue, sat, hsv[2], rgb)
    led.setRGBA(rgb[0], rgb[1], rgb[2], 255).apply()
  }

}