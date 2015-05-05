import pollen.environment as Bijou 
from Bijou import ColorLed

from pollen.time import Timer
from bijou.parts import LookupIterMeta{"Lookup.sine"} as Iterator

module ProjectorTest2 {

  host Timer iterTimer = new Timer(tick)
  host Iterator iter = new Iterator(256)
  const uint8 MaxCount = 255
  uint8 count = 0
  uint8 step = 4

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    iterTimer.start(100, true)
    Bijou.run()
  }

  tick() {    
    uint8 val
    val = iter.get(count)

    count += 10
    // if ((count + step) <= step)   // we rolled over
    // if (count == MaxCount) { count = 0 } 
    
    ColorLed.setRGB(val, val, val)
  }

}