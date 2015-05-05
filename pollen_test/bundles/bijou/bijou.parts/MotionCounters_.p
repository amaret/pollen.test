
import MMA7660FC as Accel
from pollen.time import Timer
from pollen.event import Event


module MotionCounters {
  
  enum CVars {IncrementOn, DecrementOn, SlowMin, SlowMax, FastMin, FastMax }

  const uint16 ColorCounterMax = 2048
  const uint8 ColorCounterVars[6] = {40, 29, 25, 45, 20, 50} 

  const uint8 BrightCounterMax = 100
  const uint8 BrightCounterVars[6] = {40, 29, 25, 45, 20, 50} 

  const uint8 NoiseThreshold = 4
  enum TickSpeed { Off = 0, Slow = 30, Fast = 5}

  class Counter {
    uint8 tickSpeed = TickSpeed.Slow 
    uint16 count = 0 
    uint16 max = 0
    uint8 vars[] = null

    public host Counter(uint16 max, uint8 [] vars) {
      @max = max
      @vars = vars
    }
  }

  host Timer cTimer = new Timer(cTick)
  host Timer bTimer = new Timer(bTick)

  host Counter cCounter = new Counter(ColorCounterMax, ColorCounterVars)
  host Counter bCounter = new Counter(BrightCounterMax, BrightCounterVars)

  Event cEvent = null
  Event bEvent = null

  uint8 data[3] = {0}
  uint8 xyz[3] = {0}  

  public start(Event ce, Event be) {
    Accel.start(Accel.SampleRate.Hz16)
    cEvent = ce 
    bEvent = be

    cTimer.start(cCounter.tickSpeed)
    bTimer.start(bCounter.tickSpeed)
  }

  public stop() {
    Accel.stop()
    cTimer.stop()
    bTimer.stop()
  }

  public uint16 getBrightnessCount() {
    return bCounter.count
  }

  public uint16 getColorCount() {
    return cCounter.count
  }

  //// Private Members //////////////////////////////////////////////////////// 

  bTick() {
    if (changeDetected(bCounter)) {
      updateCounter(bCounter, 1)        // bCounter is from Y axis
      //Lcd.writeNumber(bCounter.count)
      if (bEvent != null) {
        bEvent.post()
      }
    }

  }

  cTick() {
    if (changeDetected(cCounter)) {
      updateCounter(cCounter, 0)        // cCounter is from X axis
      //Lcd.writeNumber(cCounter.count)
      if (cEvent != null) {
        cEvent.post()
      }
    }
  }

  bool changeDetected(Counter c) {
    bool change = false
    int16 t1, t2

    Accel.getXYZ(data)

    for (uint8 i = 0; i < 3; i++) {
      t1 = data[i] + NoiseThreshold
      t2 = data[i] - NoiseThreshold 

      if (t1 <= c.max && t1 > xyz[i]) {
        xyz[i] = data[i]
        change = true
      } elif (t2 >= 0 && t2 < xyz[i]) {
        xyz[i] = data[i]
        change = true
      }
    }

    return change
  }

  updateCounter(Counter c, uint8 index) {
    if (xyz[index] >= c.vars[CVars.IncrementOn]) {
      if (c.count < c.max) { 
        c.count++ 
        updateSpeed(c, index)
      }      
    } elif (xyz[index] <= c.vars[CVars.DecrementOn]) {
      if (c.count > 0) { 
        c.count-- 
        updateSpeed(c, index)
      }      
    }
  }

  updateSpeed(Counter c, uint8 index) {
    uint8 newSpeed = c.tickSpeed
    uint8 val = xyz[index]

    if (val < c.vars[CVars.FastMin]) {
      newSpeed = TickSpeed.Fast
    } elif (val >= c.vars[CVars.SlowMin] && val < c.vars[CVars.SlowMax]) {
      newSpeed = TickSpeed.Slow
    } elif (val >= c.vars[CVars.FastMax]) {
      newSpeed = TickSpeed.Fast
    }

    if (newSpeed != c.tickSpeed) {
      c.tickSpeed = newSpeed
      if (index == 0) {
        cTimer.stop()
        cTimer.start(c.tickSpeed)
      } else {
        bTimer.stop()
        bTimer.start(c.tickSpeed)
      }
    }
  }

}