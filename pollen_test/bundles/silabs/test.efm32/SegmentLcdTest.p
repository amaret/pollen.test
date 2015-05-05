
import pollen.environment as Env
from silabs.stk.gecko import SegmentLcd as Lcd

module SegmentLcdTest {
  

  pollen.reset() {
    Env.reset()
  }

  pollen.run() {

    Lcd.writeString("HaaH")
    Lcd.writeNumber(123)


    Env.run()
  }

}
