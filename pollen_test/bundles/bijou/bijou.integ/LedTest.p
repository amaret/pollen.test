import pollen.environment as Bijou

from Bijou import Led0
from Bijou import Led1
from Bijou import Led2

module LedTest {
  
  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    Led0.on()
    Led1.off()
    Led2.off()
    
    while (true) { }
  }

}