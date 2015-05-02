import pollen.environment as Bijou
from Bijou import Led1
from Bijou import Led2
from Bijou import Button

module ButtonTest1 {
  
  host ButtonTest1() {
    Button.setClickHandlerOnHost(buttonPress)
    Button.setDoubleClickHandlerOnHost(doublePress)
  }

  buttonPress() {
    Led2.toggle()
  }

  doublePress() {
    Led1.toggle()
  }

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    Bijou.run()
  }

}