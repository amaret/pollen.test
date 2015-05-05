
import pollen.environment as Bijou
//from Bijou import ColorLed
from bijou.parts import MotionCounters
from pollen.event import Event
from silabs.stk.gecko import SegmentLcd as Lcd


module Test_6 {
  
  host Event bChange = new Event(brightnessChange)
  host Event cChange = new Event(colorChange)

  brightnessChange() {
    //Lcd.writeNumber(MotionCounters.getBrightnessCount())
  }

  colorChange() {
    Lcd.writeNumber(MotionCounters.getColorCount())
  }

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    //ColorLed.setRGB(xyz[0]*3, xyz[1]*3, xyz[2]*3)

    MotionCounters.start(cChange, bChange)
    Bijou.run()
  }

}