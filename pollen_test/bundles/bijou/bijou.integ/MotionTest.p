import pollen.environment as Bijou
from bijou.parts import MMA7660FC as Accel

from bijou.parts import LedState
//from silabs.stk.gecko import SegmentLcd as Lcd

from bijou.pattern import Lookup
from pollen.math import Math
from pollen.time import Timer


module MotionTest {

  class Counter {
    host uint8 upthresh
    host uint8 downthresh
    host uint16 maxcount 
    uint16 count

    public host Counter(uint8 up, uint8 down, uint16 max) {
      @upthresh = up
      @downthresh = down
      @maxcount = max 
    }
  }

  const uint8 TickSpeed = 5          // 20 millisecond tick rate (50 Hz)  
  const uint8 JitterAmount = 4
  host Timer t = new Timer(tick)
  host Counter counters[2] = { new Counter(45, 20, 1972), new Counter(40, 21, 200) }  // Color Counter, Brightness Counter
                             
  uint8 xyz[3] = {0}
  uint8 lastxyz[3] = {0}  

  host LedState led = new LedState(0)

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    counters[1].count = counters[1].maxcount / 2
    led.setRGBA(255, 255, 255, 255).apply()

    Accel.start(Accel.SampleRate.Hz16)    
    t.start(TickSpeed)
    Bijou.run()
  }

  tick() {
    Accel.getXYZ(xyz)

    if (detectChange(0)) {         // detect change in x motion
      updateCounters(0)

      // uint8 r = Lookup.map(Math.rand16(), 0, 65535, 100, 255)
      // uint8 g = Lookup.map(Math.rand16(), 0, 65535, 100, 255)
      // uint8 b = Lookup.map(Math.rand16(), 0, 65535, 100, 255)

      // led.setRGB(r, g, b).apply()
      updateColor()
      //Lcd.writeNumber(counters[0].count)
    }

    if (detectChange(1)) {        // detect change in y motion
      updateCounters(1)
      updateBrightness()          
      //Lcd.writeNumber(counters[1].count)
    }
  }

  bool detectChange(uint8 index) {
    int16 t1, t2

    t1 = xyz[index] + JitterAmount
    t2 = xyz[index] - JitterAmount 

    if (t1 > lastxyz[index]) {
      lastxyz[index] = xyz[index]
      return true
    } elif (t2 >= 0 && t2 < lastxyz[index]) {
      lastxyz[index] = xyz[index]
      return true
    }

    return false
  }

  updateCounters(uint8 index) {
    uint8 val = lastxyz[index]
    if (val >= counters[index].upthresh) {                      // Tilt Up Count Threshold 
      if ((counters[index].count+2) < counters[index].maxcount) { 
        counters[index].count += 2 
      }
    } elif (val <= counters[index].downthresh) {                // Tilt Down Count Threshold
      if ((counters[index].count-2) > 0) { 
        counters[index].count -= 2 
      }
    }
  }

  updateColor() {
    uint8 stage = counters[0].count / 256
    uint8 val = counters[0].count - (stage*256)

    // if   (stage == 0) { led.setRed(val) }               // red up
    // elif (stage == 1) { led.setBlue(val) }              // blue up
    // elif (stage == 2) { led.setRed(255 - val) }         // red down
    // elif (stage == 3) { led.setGreen(val) }             // green up
    // elif (stage == 4) { led.setBlue(255 - val) }        // blue down
    // elif (stage == 5) { led.setRed(val) }               // red up
    // elif (stage == 6) { led.setBlue(val) }              // blue up

                                                      // starts r, g, b
    if   (stage == 0) { led.setBlue(255-val) }        // blue down, (r, g)
    elif (stage == 1) { led.setRed(255-val)  }        // red down, (g)
    elif (stage == 2) { led.setBlue(val) }            // blue up, (g, b)
    elif (stage == 3) { led.setGreen(255-val) }       // green down (b)
    elif (stage == 4) { led.setRed(val) }             // red up (r, b)
    elif (stage == 5) { led.setBlue(255-val) }        // blue down (r)


    led.apply()
  }

  updateBrightness() {
    uint8 x = (counters[1].count / 200.0) * 255
    led.setAlpha(x)
    led.apply()
  }


}
