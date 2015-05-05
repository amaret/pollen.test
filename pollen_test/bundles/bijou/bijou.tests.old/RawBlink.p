from silabs.efm32 import EFM32ZG108 as Bijou

from Bijou import PC0 as Red
from Bijou import PC1 as Green
from Bijou import PB7 as Blue

module RawBlink {

  RawBlink() {
    Red.makeOutput()
    Red.set()           // active low, turn off

    Green.makeOutput()
    Green.set()           // active low, turn off

    Blue.makeOutput()
    Blue.set()           // active low, turn off

  }

  pollen.reset() {
    Bijou.reset()        
  }
  
  pollen.run() {
    while(true) {    

      red(true)
      green(false)
      blue(false)
      delay()

      red(false)
      green(true)
      blue(false)
      delay()

      red(false)
      green(false)
      blue(true)
      delay()

      red(true)
      green(true)
      blue(false)
      delay()

      red(true)
      green(false)
      blue(true)
      delay()

      red(false)
      green(true)
      blue(true)
      delay()

      red(true)
      green(true)
      blue(true)
      delay()
    }
  }

  delay() { 
    for (uint16 i = 0; i < 500; ++i) {
      Bijou.wait(750)
    }
  }

  red(bool on) {
    if (on) {
      Red.clear()
    } else {
      Red.set()
    }
  }

  green(bool on) {
    if (on) {
      Green.clear()
    } else {
      Green.set()
    }
  }

  blue(bool on) {
    if (on) {
      Blue.clear()
    } else {
      Blue.set()
    }
  }


}