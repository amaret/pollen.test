
from bijou.parts import Scene

class PatternParameters {
  
  host uint16 MinDrawRate = 20                     // milliseconds
  Scene scene = null

  uint16 drawRate = 0                  
  uint16 ticksToStop = 0

  uint32 duration = 0
  uint16 patternSteps = 0                       // how many steps are in this pattern
  uint16 count = 0
  uint8 step = 1      

  public host PatternParameters(uint16 steps) {
    patternSteps = steps
  }

  public host setMinTickRateOnHost(uint16 rate) {
    MinDrawRate = rate
  }

  public setScene(Scene s) {
    @scene = s
    @duration = scene.getDuration()
    @drawRate = @ticksToStop = 0
    @step = 1

    drawRate = duration / (patternSteps / step)

    while(drawRate < MinDrawRate) {
      ++step
      drawRate = duration / (patternSteps / step)
    }

    ticksToStop = duration / drawRate
  }

  public Scene getCurrentScene() {
    return @scene
  }

  public uint16 getTicksToStop() {
    return @ticksToStop
  }

  public uint16 getDrawRate() {
    return @drawRate
  }

  public uint32 getDuration() {
    return @duration
  }

  public uint16 getNumPatternSteps() { 
    return @patternSteps
  }

  public uint16 getCount() {
    return @count
  }

  public bool update() {
    count += step
    if (count > patternSteps) {
      count = 0
    }

    if (ticksToStop == 0) { 
      return false
    }
    else { 
      ticksToStop-- 
      return true
    }
  }

}