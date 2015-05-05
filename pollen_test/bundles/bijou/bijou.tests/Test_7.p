
import pollen.environment as Bijou
from Bijou import ColorLed

from bijou.parts import MotionCounters
from pollen.event import Event
from silabs.stk.gecko import SegmentLcd as Lcd


module Test_7 {
  
  host Event bChange = new Event(brightnessChange)
  host Event cChange = new Event(colorChange)

  brightnessChange() {
    //Lcd.writeNumber(MotionCounters.getBrightnessCount())
  }

  colorChange() {
    uint8 color = MotionCounters.getColorCount()
    Lcd.writeNumber(color)
    ColorLed.setRGB(color, color, color)
  }

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {

    MotionCounters.start(cChange, bChange)
    Bijou.run()
  }

}