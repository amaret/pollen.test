!--
  Composition that defines an environment for the Arduino Uno

  This composition should eventually extend the specific Mcu it uses.
 --!

from atmel.atmega import ATmega328 as Mcu
from Mcu import GlobalInterrupts
from Mcu import TimerMilliTC1
from Mcu import Timer1MatchAInterrupt
from Mcu import PB5
from Mcu import PB4
from Mcu import PB3

from pollen.event import Newsroom
from pollen.time import TimerManager
from pollen.parts import LedMeta as Led

composition Uno extends Mcu {

  preset Uno() {
    Led.pin := PB5
    Newsroom.GI := GlobalInterrupts
    TimerMilliTC1.TimerInterrupt := Timer1MatchAInterrupt    
    TimerManager.HwTimer := TimerMilliTC1
    
    Mcu.setFrequencyOnHost(16000000)
    Uart.setBaudOnHost(38400)
  }

  export Mcu
  export GlobalInterrupts
  export Led

  export PB4
  export PB3

}