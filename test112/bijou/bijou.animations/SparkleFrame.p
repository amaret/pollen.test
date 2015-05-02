import pollen.environment as Bijou 
from Bijou import ColorLed

from bijou.parts import Lookup
import ProjectableProtocol 

class SparkleFrame implements ProjectableProtocol {
  
  int16 tickCount = 255
  ProjectableType type = ProjectableType.Dynamic

  public ProjectableType getTypeOnHost() { return type }
  public ProjectableType getType() { return type }

  public setFrame() {
    int16 val = Lookup.gamma(tickCount)
    tickCount -= 4

    if (tickCount <= 0) { 
      tickCount = 255
      val = 0      
    }

    ColorLed.setRGB(val, val, val)
   }
}