import pollen.environment as Bijou
from Bijou import ColorLed
from pollen.math import Math

class LedState {
  
  enum Colors {Red, Green, Blue, Alpha}
  host uint8 id = 0
  uint8 rgba[4] = {0, 0, 0, 0}

  public host LedState(uint8 id) {
    @id = id
    @rgba[Colors.Red] = 0
    @rgba[Colors.Green] = 0
    @rgba[Colors.Blue] = 0
    @rgba[Colors.Alpha] = 255
  }

  public uint8 getId() { 
    return @id
  }

  public setId(uint8 id) {
    @id = id
  }

  public LedState setState(LedState state) {
    state.getRGBA(@rgba)
    return @ 
  }

  public apply() {
    ColorLed.setState(@)
  }

  public LedState setRGB(uint8 red, uint8 green, uint8 blue) {
    @rgba[Colors.Red] = red
    @rgba[Colors.Green] = green
    @rgba[Colors.Blue] = blue
    return @    
  }  

  public LedState setRGBA(uint8 red, uint8 green, uint8 blue, uint8 alpha) {
    @rgba[Colors.Red] = red
    @rgba[Colors.Green] = green
    @rgba[Colors.Blue] = blue
    @rgba[Colors.Alpha] = alpha
    return @
  }

  public getRGBA(uint8 [] rgba) {
    rgba[Colors.Red]   = @rgba[Colors.Red]
    rgba[Colors.Green] = @rgba[Colors.Green]
    rgba[Colors.Blue]  = @rgba[Colors.Blue]
    rgba[Colors.Alpha] = @rgba[Colors.Alpha]
  }
  
  public getRGB(uint8 [] rgb) {
    rgb[Colors.Red]   = @rgba[Colors.Red]
    rgb[Colors.Green] = @rgba[Colors.Green]
    rgb[Colors.Blue]  = @rgba[Colors.Blue]
  }

  public LedState setRed(uint8 red) { 
    @rgba[Colors.Red] = red 
    return @
  }

  public uint8 getRed() { return @rgba[Colors.Red] }

  public LedState setGreen(uint8 green) { 
    @rgba[Colors.Green] = green 
    return @
  }  

  public uint8 getGreen() { return @rgba[Colors.Green] }  

  public LedState setBlue(uint8 blue) { 
    @rgba[Colors.Blue] = blue 
    return @
  }  
  
  public uint8 getBlue() { return @rgba[Colors.Blue] }  

  public LedState setAlpha(uint8 alpha) { 
    @rgba[Colors.Alpha] = alpha 
    return @
  }

  public uint8 getAlpha() { return @rgba[Colors.Alpha] }  

}