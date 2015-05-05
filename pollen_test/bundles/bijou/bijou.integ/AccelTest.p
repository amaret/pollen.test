import pollen.environment as Bijou
from bijou.parts import MMA7660FC as Accel

from Bijou import Led0

from pollen.time import Timer
from silabs.stk.gecko import SegmentLcd as Lcd

module AccelTest {
    
  host Timer t = new Timer(tick)
  uint16 colorPos = 127
  uint16 brightPos = 127
  uint8 xyz[3] = {0}
  uint8 lastxyz[3] = {0}  
  const uint16 MaxVal = 2048
  const uint8 MinVal = 0
  const uint8 Speed1 = 25
  const uint8 Speed2 = 25
  const uint8 Speed3 = 25
  const uint8 threshold = 4
  uint8 tickSpeed = Speed1

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {

    Accel.start(Accel.SampleRate.Hz16)
    t.start(tickSpeed)
    Bijou.run()
  }


  tick() {
    Accel.getXYZ(xyz)

    if (detectChange()) {
      updateColorPosition()
      // updateBrightnessPosition()
      
      Lcd.writeNumber(colorPos)
      //Lcd.writeNumber(lastxyz[0])
    }
  }

  bool detectChange() {
    int16 t1, t2
    bool change = false

    for (uint8 i = 0; i < 3; i++) {
      t1 = xyz[i] + threshold
      t2 = xyz[i] - threshold 

      if (t1 <= MaxVal && t1 > lastxyz[i]) {
        lastxyz[i] = xyz[i]
        change = true
      } elif (t2 >= MinVal && t2 < lastxyz[i]) {
        lastxyz[i] = xyz[i]
        change = true
      }
    }

    return change
  }

  updateColorPosition() {
    if (lastxyz[0] >= 45) {
      if ((colorPos+2) < MaxVal) { 
        colorPos += 2 
      }
      updateSpeed(lastxyz[0])
    } elif (lastxyz[0] <= 25) {
      if ((colorPos-2) > MinVal) { 
        colorPos -= 2 
      }
      updateSpeed(lastxyz[0])        
    }
  }

  updateSpeed(uint8 x) {
    uint8 newSpeed = tickSpeed

    if (x < 20) {
      newSpeed = Speed3
    } elif (x >= 20 && x < 25) {
      newSpeed = Speed2
    } elif (x >= 25 && x < 45) {
      newSpeed = Speed1
    } elif (x >= 45 && x < 50) {
      newSpeed = Speed2
    } elif (x >= 50) {
      newSpeed = Speed3
    }

    if (newSpeed != tickSpeed) {
      tickSpeed = newSpeed
      t.stop()
      t.start(tickSpeed)
    }
  }

  // updateBrightnessPosition() {
  //   //uint8 curPos = brightPos

  //   if (lastxyz[1] >= 40) {
  //     brightPos++
  //   } elif (lastxyz[1] =< 29) {
  //     brightPos--
  //   }
  // }


}


  // First attempt:
  //   Linear walk through the numbers, 
  //     Use a timer to increment the 'cursor' in the given direction the user is moving

  //   at a frequency of 10x / second: 
  //     if accel.direction == forward:
  //       increment brightness position
  //     elif accel.direction == backward:
  //       decrement brightness position
  //     elif accel.direction == right:
  //       increment color position
  //     elif accel.direction == right:
  //       decrement color position
