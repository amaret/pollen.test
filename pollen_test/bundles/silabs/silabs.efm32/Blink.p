
import EFM32ZG108 as Mcu
//import EFM32ZG222 as Mcu

from Mcu import PC0 as Green
from Mcu import PC1 as Red
from Mcu import PB7 as Blue

// from Mcu import PC10 as Green
// from Mcu import PC11 as Blue

module Blink {

  Blink() {
    Blue.makeOutput()
    Blue.set()            // active low, turn off

    Green.makeOutput()
    Green.set()           // active low, turn off

    Red.makeOutput()
    Red.set()           // active low, turn off
  }  

  pollen.reset() {
    Mcu.rese()
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

      // red(false)
      // green(false)
      // blue(false)
      // delay()

    }

  }

  delay() { 
    for (uint16 i = 0; i < 500; ++i) {
      Mcu.wait(25)
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