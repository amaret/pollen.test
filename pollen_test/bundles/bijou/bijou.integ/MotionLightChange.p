
import pollen.environment as Bijou
from Bijou import ColorLed

from bijou.parts import MotionCounters
from pollen.event import Event
from bijou.pattern import Lookup

module MotionLightChange {
  
  host Event bChange = new Event(brightnessChange)
  host Event cChange = new Event(colorChange)

  uint8 red = 0
  uint8 green = 0
  uint8 blue = 0
  real brightness = 0.0

  brightnessChange() {
    uint16 b = MotionCounters.getBrightnessCount()
    brightness = b / 100.0

    //uint8 val = 255 * brightness
    //ColorLed.setRGB(Lookup.gamma(val), 0, 0)
  }

  colorChange() {
    uint16 c = MotionCounters.getColorCount()    
    updateColor(c)
  }

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    MotionCounters.start(cChange, bChange)
    Bijou.run()
  }


  updateColor(uint16 position) {
    uint8 state = position / 256
    uint8 val = position - (256*state)

    if (state == 0)   { red = val }      // 0 = red up, 1 = green up, 2 = red down, 3 = blue up, 4 = green down, 5 = red up, 6 = blue down, 7 = red down
    elif (state == 1) { green = val }
    elif (state == 2) { red = 255 - val }
    elif (state == 3) { blue = val }
    elif (state == 4) { green = 255 - val }
    elif (state == 5) { red = val }
    elif (state == 6) { blue = 255 - val }
    elif (state == 7) { red = 255 - val }

    ColorLed.setRGB(red * brightness, green * brightness, blue * brightness)
  }

}