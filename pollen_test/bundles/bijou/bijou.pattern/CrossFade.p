!--

  This module is a pattern which cross fades between the present color of the
  ColorLed and the specified one

--! 

// get current rgb
// get new rgb
// get the maximum distance between new and current rgbs 
// in num ticks 
//  increment or decrement current r, g, b to get to new r, g, b

// numTicks * FadeTick = duration
// in numTicks i need to move r, g and b to their destination
// r, g, and b are a certain distance (positive or negative) from their destination
// maximum distance must be traveled in numTicks. 
// step per tick = maximum distance / numTicks
// if step == 0, make it 1
//
// on each loop iteration add/subract to r,g,b until at destination
//

import pollen.environment as Bijou 
from Bijou import ColorLed

from bijou.parts import Scene
from pollen.time import Timer
from pollen.math import Math


module CrossFade {

  const uint8 FadeTick = 4
  host Timer fadeTimer = new Timer(fade)
  Scene scene = null
  uint16 tickCount = 0
  uint16 numTicks = 0
  uint8 rgbaFrom[4] = {0, 0, 0, 0}
  uint8 rgbaTo[4] = {0, 0, 0, 0}
  uint8 rgbaStep[4] = {0, 0, 0, 0}

  public start(Scene s) {
    @scene = s
    @tickCount = 0
    ColorLed.getRGBA(@rgbaFrom)                         // get current rgb

    numTicks = s.getDuration() / FadeTick
    if (numTicks == 0) {
      numTicks = 1
    }

    for (uint8 i = 0; i < 4; i++) {
      int8 dist = rgbaTo[i] - rgbaFrom[i]
      print "CrossFade TO [" + i + "] = " + rgbaTo[i] + "\n"
      print "CrossFade FROM [" + i + "] = " + rgbaFrom[i] + "\n"
      print "CrossFade TO - FROM [" + i + "] = " + dist + "\n"

      rgbaStep[i] = dist / numTicks
      if (rgbaStep[i] == 0) {
        rgbaStep[i] = 1
      }
    }

    print "CrossFade start numTicks=" + numTicks + "\n"
    print "CrossFade start steps: " + rgbaStep[0] + " " + rgbaStep[1] + " " + rgbaStep[2] + " " + rgbaStep[3] + "\n"

    fadeTimer.start(FadeTick)
  }

  public stop() {
    @fadeTimer.stop()
    if (@scene != null) {
      @scene.stopped()
    }
  }

  public fadeTo(uint8 r, uint8 g, uint8 b, uint8 a) {
    @rgbaTo[0] = r
    @rgbaTo[1] = g
    @rgbaTo[2] = b
    @rgbaTo[3] = a
  }


  fade() {
    uint8 i = 0

    for (i = 0; i < 4; i++) {
      if (rgbaFrom[i] < rgbaTo[i]) {
        rgbaFrom[i] += rgbaStep[i]
      } elif(rgbaFrom[i] > rgbaTo[i]) {
        rgbaFrom[i] -= rgbaStep[i]
      }
    }

    ColorLed.setRGBA(rgbaFrom[0], rgbaFrom[1], rgbaFrom[2], rgbaFrom[3])

    if (tickCount == numTicks) {      
      stop()
    } else {
      tickCount++
    }   
  }

}

