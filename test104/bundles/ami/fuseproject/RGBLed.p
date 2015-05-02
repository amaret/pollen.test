
class RGBLed {
  
  const uint8 RED = 0
  const uint8 GREEN = 1
  const uint8 BLUE = 2

  uint8 rgb[3] = {0}

  public host RGBLed(uint8 red, uint8 green, uint8 blue) {
    rgb[RED] = red
    rgb[GREEN] = green
    rgb[BLUE] = blue
  }


  public RGBLed(uint8 red, uint8 green, uint8 blue) {
    rgb[RED] = red
    rgb[GREEN] = green
    rgb[BLUE] = blue
  }

  public uint8[] getRGB() {
    return rgb
  }

  public setRed(uint8 r)   { rgb[RED] = r   }
  public setGreen(uint8 g) { rgb[GREEN] = g }
  public setBlue(uint8 b)  { rgb[BLUE] = b  }

  public uint8 getRed()   { return rgb[RED]   }
  public uint8 getGreen() { return rgb[GREEN] }
  public uint8 getBlue()  { return rgb[BLUE]  }

  public uint8 getMinValue() {
    uint8 min

    if (rgb[RED] < rgb[GREEN]) { min = rgb[RED] } 
    else { min = rgb[GREEN] }
    if (rgb[BLUE] < min) { min = rgb[BLUE] }

    return min
  }

}