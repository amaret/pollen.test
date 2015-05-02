

class Color {
  
  uint8 rgba[4] = {0, 0, 0, 0}

  public host Color(uint8 red, uint8 green, uint8 blue, uint8 alpha) {
    rgba[0] = red
    rgba[1] = green
    rgba[2] = blue
    rgba[3] = alpha
  }

  public Color(uint8 red, uint8 green, uint8 blue, uint8 alpha) {
    rgba[0] = red
    rgba[1] = green
    rgba[2] = blue
    rgba[3] = alpha    
  }

  public setRGBA(uint8 red, uint8 green, uint8 blue, uint8 alpha) {
    rgba[0] = red
    rgba[1] = green
    rgba[2] = blue
    rgba[3] = alpha
  }

  public setRGB(uint8 red, uint8 green, uint8 blue) {
    rgba[0] = red
    rgba[1] = green
    rgba[2] = blue
  }  

  public setFromColor(Color p) {
    p.getRGBA(@rgba)
  }

  public getRGBA(uint8 [] rgba) {
    rgba[0] = @rgba[0]
    rgba[1] = @rgba[1]
    rgba[2] = @rgba[2]
    rgba[3] = @rgba[3]
  }
  
  public getRGB(uint8 [] rgb) {
    rgb[0] = @rgba[0]
    rgb[1] = @rgba[1]
    rgb[2] = @rgba[2]
  }

  public setRed(uint8 red) { rgba[0] = red }
  public uint8 getRed() { return rgba[0] }

  public setGreen(uint8 green) { rgba[1] = green }  
  public uint8 getGreen() { return rgba[1] }  

  public setBlue(uint8 blue) { rgba[2] = blue }  
  public uint8 getBlue() { return rgba[2] }  

}