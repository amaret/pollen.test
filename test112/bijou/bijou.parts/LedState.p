import pollen.environment as Bijou
from Bijou import ColorLed

class LedState {
  
  enum Colors {Red, Green, Blue, Alpha}
  host uint8 id = 0
  uint8 rgba[4] = {0, 0, 0, 0}

  public host LedState(uint8 id, uint8 red, uint8 green, uint8 blue) {
    @id = id
    @rgba[Colors.Red] = red
    @rgba[Colors.Green] = green
    @rgba[Colors.Blue] = blue
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

  public setRGBA(uint8 red, uint8 green, uint8 blue, uint8 alpha) {
    @rgba[Colors.Red] = red
    @rgba[Colors.Green] = green
    @rgba[Colors.Blue] = blue
    @rgba[Colors.Alpha] = alpha
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

  public setRed(uint8 red) { @rgba[Colors.Red] = red }
  public uint8 getRed() { return @rgba[Colors.Red] }

  public setGreen(uint8 green) { @rgba[Colors.Green] = green }  
  public uint8 getGreen() { return @rgba[Colors.Green] }  

  public setBlue(uint8 blue) { @rgba[Colors.Blue] = blue }  
  public uint8 getBlue() { return @rgba[Colors.Blue] }  

  public setAlpha(uint8 alpha) { @rgba[Colors.Alpha] = alpha }  
  public uint8 getAlpha() { return @rgba[Colors.Alpha] }  

}