import pollen.environment as Bijou

from Bijou import ColorLed
from Bijou import Button
from pollen.time import Timer
from bijou.parts import Lookup

module FrameTest1 {
  
  host Timer fTimer = new Timer(frameTick)
  host uint8 NumCurves = 8
  uint8 curve = 0
  uint16 count = 255

  host uint8 FPS = 200
  host uint8 fTimerDuration = 0

  host FrameTest1() {
    Button.setClickHandlerOnHost(buttonClick)
    fTimerDuration = 1000 / FPS
    print "fTimerDuration = " + fTimerDuration + "\n"
  }

  pollen.reset() { 
    Bijou.reset()
  }

  pollen.run() { 

    fTimer.start(2, true)
    Bijou.run()
  }

  buttonClick() {
    curve++
    if (curve == NumCurves) { curve = 0 }
  }

  frameTick() {
    uint8 val 

    val = count
    count -= 4
    if (count < 0) { count == 255 }
    // if (curve == 0)   { val = Lookup.test(count) } 
    // elif (curve == 1) { val = Lookup.fadein(count) } 
    // elif (curve == 2) { val = Lookup.gamma(count) }
    // elif (curve == 3) { val = Lookup.twowaygamma(count) }
    // elif (curve == 4) { val = Lookup.icosine(count) }
    // elif (curve == 5) { val = (255 - Lookup.icosine(count)) }
    // elif (curve == 6) { val = Lookup.sine(count) }    
    // elif (curve == 7) { val = Lookup.fadeout(count) }

    // count++
    // //if (count == Lookup.getCurveSize()) { count = 0 }
    // if (count == FPS) { count = 0 }

    ColorLed.setRGB(val, val, val)
  }

}