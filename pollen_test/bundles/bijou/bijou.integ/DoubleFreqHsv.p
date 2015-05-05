import pollen.environment as Bijou

from bijou.parts import ColorSpace
from bijou.parts import LedState
from pollen.math import Math
from pollen.time import Timer

// Green, Pink, Yellow, Blue, Touqoise, Cyan / baby blue.

// Make a flash to color pattern - flash start color, flash end color
// Turn this into a pattern too

module DoubleFreqHsv {
  
  const uint16 LowFreqTick = 1000
  const uint16 HighFreqTick = 15

  host Timer lowFreqT = new Timer(lowFreq)
  host Timer highFreqT = new Timer(highFreq)

  host LedState led = new LedState(0)
  real hsv[3] = { 0.0, 0.13, 1.0 }
  uint8 rgb[3] = {0}

  pollen.run() {    
    highFreqT.start(HighFreqTick)
    lowFreqT.start(LowFreqTick)
    Bijou.run()
  }

  //
  // At the high frequency, we want to vary the current hue and saturation quickly within a certain distance
  // This should give a flickering type effect 
  //

  const real HueDist = 0.01
  const real SatDist = 0.13
  host real HueDiv = (65535 / HueDist)    // this divisor makes sure we get a result no bigger than HueDist
  host real SatDiv = (65535 / SatDist)    // this divisor makes sure we get a result no bigger than SatDist

  highFreq() {
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
    print "HSV Values: [" + hue + ", " + sat + ", 1.0]\n"
    led.setRGBA(rgb[0], rgb[1], rgb[2], 255).apply()
  }


  //
  // At the low frequency, we want to vary the overall saturation, try slowly, then 
  //
  uint8 counter = 0

  lowFreq() {
  //       ColorSpace.hsvToRgb(h, s, v, rgb)
  //       led.setRGBA(rgb[0], rgb[1], rgb[2], 255).apply()
    hsv[0] = counter / 255.0
    counter++
  }



}