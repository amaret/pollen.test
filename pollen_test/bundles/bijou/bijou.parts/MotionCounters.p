
import MMA7660FC as Accel
from pollen.time import Timer
from pollen.event import Event


module MotionCounters {
  
  const uint16 ColorCounterMax = 2048
  const uint8 BrightnessCounterMax = 100
  const uint8 NoiseThreshold = 4
  enum TickSpeed { Off = 0, Slow = 8, Medium = 8, Fast = 8}

  class Counter {
    uint8 tickSpeed = TickSpeed.Slow 
    uint16 count = 0 
    uint16 min = 0 
    uint16 max = 255 

    public host Counter(uint16 min, uint16 max) {
      @min = min
      @max = max
    }
  }

  host Timer cTimer = new Timer(cTick)
  host Timer bTimer = new Timer(bTick)

  host Counter cCounter = new Counter(0, ColorCounterMax)
  host Counter bCounter = new Counter(0, BrightnessCounterMax)

  Event cEvent = null
  Event bEvent = null

  uint8 data[3] = {0}
  uint8 xyz[3] = {0}  

  public start(Event ce, Event be) {
    Accel.start(Accel.SampleRate.Hz32)
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
      if (bEvent != null) {
        bEvent.post()
      }
      updateBrightnessCounter()        // bCounter is from Y axis
      //Lcd.writeNumber(bCounter.count)      
    }

  }

  cTick() {
    if (changeDetected(cCounter)) {
      if (cEvent != null) {
        cEvent.post()
      }
      updateColorCounter()        // cCounter is from X axis
      //Lcd.writeNumber(cCounter.count)
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
      } elif (t2 >= c.min && t2 < xyz[i]) {
        xyz[i] = data[i]
        change = true
      }
    }

    return change
  }

  updateBrightnessCounter() {
    uint8 incrThresh = 40
    uint8 decrThresh = 20

    if (xyz[1] >= incrThresh) {
      if (bCounter.count < bCounter.max) { 
        bCounter.count++ 
        //updateSpeed(bCounter, 1)
      }      
    } elif (xyz[1] <= decrThresh) {
      if (bCounter.count > 2) { 
        bCounter.count-- 
        //updateSpeed(bCounter, 1)
      }      
    }
  }

  updateColorCounter() {
    uint8 incrThresh = 40
    uint8 decrThresh = 29

    if (xyz[0] >= incrThresh) {
      if (cCounter.count < cCounter.max) { 
        cCounter.count++ 
        updateSpeed(cCounter, 0)
      }      
    } elif (xyz[0] <= decrThresh) {
      if (cCounter.count > 0) { 
        cCounter.count-- 
        updateSpeed(cCounter, 0)
      }      
    }
  }

  updateSpeed(Counter c, uint8 index) {
    uint8 newSpeed = c.tickSpeed
    uint8 x = xyz[index]

    if (x < 20) {
      newSpeed = TickSpeed.Fast
    } elif (x >= 20 && x < 25) {
      newSpeed = TickSpeed.Medium
    } elif (x >= 25 && x < 45) {
      newSpeed = TickSpeed.Slow
    } elif (x >= 45 && x < 50) {
      newSpeed = TickSpeed.Medium
    } elif (x >= 50) {
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