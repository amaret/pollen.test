import pollen.environment as Bijou
from Bijou import Led0
from Bijou import Led1
from Bijou import Led2
from bijou.parts import ColorLed
from bijou.parts import LedState

module ColorLedTest {
  
  host LedState state = new LedState(127, 127, 127, 1)

  host ColorLedTest() {
    ColorLed.Red := Led0
    ColorLed.Green := Led1
    ColorLed.Blue := Led2
  }

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    ColorLed.setRGB(255, 255, 255)

    Bijou.run()
  }

}