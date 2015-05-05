import pollen.environment as Env

from Env import Led0
from Env import Led1
from Env import Led2
from Env import Led3
from Env import Led4
from Env import Led5
from Env import Led6
from Env import Led7
from Env import Led8
from Env import Led9
from Env import Led10
from Env import Led11
from Env import Led12
from Env import Led13
from Env import Led14
from Env import Led15
from Env import Led16
from Env import Led17
from Env import Led18
from Env import Led19
from Env import Led20
from Env import Led21
from Env import Led22
from Env import Led23


from pollen.event import HandlerProtocol
import LedState

module LedManager {

  const uint8 NumLeds = 24
  host LedState leds[NumLeds] = { new LedState(Led0.on, Led0.off),
                                  new LedState(Led1.on, Led1.off),
                                  new LedState(Led2.on, Led2.off),
                                  new LedState(Led3.on, Led3.off),
                                  new LedState(Led4.on, Led4.off),
                                  new LedState(Led5.on, Led5.off),
                                  new LedState(Led6.on, Led6.off),
                                  new LedState(Led7.on, Led7.off),
                                  new LedState(Led8.on, Led8.off),
                                  new LedState(Led9.on, Led9.off),
                                  new LedState(Led10.on, Led10.off),
                                  new LedState(Led11.on, Led11.off),
                                  new LedState(Led12.on, Led12.off),
                                  new LedState(Led13.on, Led13.off),
                                  new LedState(Led14.on, Led14.off),
                                  new LedState(Led15.on, Led15.off),
                                  new LedState(Led16.on, Led16.off),
                                  new LedState(Led17.on, Led17.off),
                                  new LedState(Led18.on, Led18.off),
                                  new LedState(Led19.on, Led19.off),
                                  new LedState(Led20.on, Led20.off),                                  
                                  new LedState(Led21.on, Led21.off),
                                  new LedState(Led22.on, Led22.off),
                                  new LedState(Led23.on, Led23.off) }

  public uint8 getNumLeds() {
    return NumLeds
  }                               

  public setRGBALed(uint8 led, uint8 red, uint8 green, uint8 blue, uint8 alpha) {
    LedState s = null

    if (led < NumLeds) {
      s = leds[led]
      if (red != 0 || green != 0 || blue != 0) {
        s.on()
      } elif (red == 0 && green == 0 && blue == 0) {
        s.off()
      }      
    }
  }

  public setXY(uint8 x, uint8 y, uint8 red, uint8 green, uint8 blue) {
    LedState s = null
    uint8 index = (6 * y) + x;

    if (index < NumLeds) {
      s = leds[index]
      if (red != 0 || green != 0 || blue != 0) {
        s.on()
      } elif (red == 0 && green == 0 && blue == 0) {
        s.off()
      }      
    }


  }

  public allOn() {
    LedState s = null

    for (uint8 i = 0; i < NumLeds; ++i) {
      s = leds[i]
      s.on()
    }
  }

  public allOff() {
    LedState s = null

    for (uint8 i = 0; i < NumLeds; ++i) {
      s = leds[i]
      s.off()
    }
  }

}
