import pollen.environment as Bijou

from bijou.parts import Lookup

module Test8 {

  const uint16 TickDuration = 5
  const uint16 PatternLen = 256
  uint16 duration = 100

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    uint16 numTicks = duration / TickDuration       // return floor of value

    if (numTicks == 0) {
      numTicks = 1
    }

    print "Duration = " + duration + " Num ticks = " + numTicks + "\n"

    for (uint16 i = 0; i < numTicks; i++) {
      uint8 val = Lookup.map(i, 0, numTicks, 0, PatternLen)
      print val + ", "
    }

  }

  pollen.shutdown() {

  }

}