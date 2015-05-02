!--
  Composition that defines an environment for the Arduino Uno

  This composition should eventually extend the specific Mcu it uses.
 --!

from atmel.atmega import ATmega328 as Mcu
from Mcu import TimerMilliTC1
from Mcu import Timer1MatchAInterrupt
from Mcu import PB5

from pollen.parts import LedMeta as Led


composition Uno extends Mcu {

  preset {
    Mcu.setFrequencyOnHost(16000000)
    Uart.setBaudOnHost(38400)
  }

  host Uno() {
    TimerMilliTC1.TimerInterrupt := Timer1MatchAInterrupt
    Led.pin := PB5
  }

  export Led

}