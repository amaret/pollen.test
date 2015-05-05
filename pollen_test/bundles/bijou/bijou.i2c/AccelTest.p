
import pollen.environment as Bijou
import MMA7660FC as Accel

from Bijou import ColorLed
from pollen.time import Timer
from silabs.stk.gecko import SegmentLcd as Lcd

module AccelTest {
  
  host Timer t = new Timer(sampleAccel)
  uint8 xyz[3] = {0}

  pollen.reset() {
    Bijou.reset()
  }

  sampleAccel() {
    Accel.getXYZ(xyz)
    Lcd.writeNumber(xyz[0])
    ColorLed.setRGB(xyz[0]*3, xyz[1]*3, xyz[2]*3)
  }

  pollen.run() {

    Accel.start(Accel.SampleRate.Hz16)
    t.start(100)

    Bijou.run()
  }

}