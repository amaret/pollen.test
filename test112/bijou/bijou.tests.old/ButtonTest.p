import pollen.environment as Bijou

from Bijou import Led0
from bijou.parts import Button


module ButtonTest {

  host ButtonTest() {
    Button.setPressHandlerOnHost(ledToggle)
  }

  pollen.reset() {
    Bijou.reset()
  }

  ledToggle() {
    Led0.toggle()
  }

  pollen.run() {
    Bijou.run()
  }
  
}