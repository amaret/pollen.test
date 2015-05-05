import DotMatrix as Matrix

class RGBMatrixLed {

  const uint8 RED = 0
  const uint8 GREEN = 1
  const uint8 BLUE = 2

  host uint8 rows[3] = {0}
  host uint8 columns[3] = {0}
  uint8 data[3] = {0}

  public host RGBMatrixLed(uint8 rcolumn, uint8 rrow, uint8 gcolumn, uint8 grow, uint8 bcolumn, uint8 brow) {
    @columns[RED] = rcolumn
    @rows[RED] = rrow
    @columns[GREEN] = gcolumn
    @rows[GREEN] = grow
    @columns[BLUE] = bcolumn
    @rows[BLUE] = brow

    // print "creating new matrix led: rc=" + rcolumn + " rr=" + rrow + " gc=" + gcolumn + " gr=" + grow + " bc=" + bcolumn + " br=" + brow + "\n"
    // for(uint8 i = 0; i < 3; i++) {
    //   print i + ") column=" + @columns[i] + " row=" + @rows[i] + " data=" + @data[i] + "\n"
    // }

  }

  public set(uint8 red, uint8 green, uint8 blue) {
    setRed(red)
    setGreen(green)
    setBlue(blue)
  }

  public uint8 getRed() { return @data[RED] }

  public setRed(uint8 red) {
    if (@data[RED] != red) {
      @data[RED] = red  
      if (red != 0) {
        Matrix.setDot(@columns[RED], @rows[RED])
      }  else {
        Matrix.clearDot(@columns[RED], @rows[RED])
      }
    }
  }

  public uint8 getGreen() { return @data[GREEN] }

  public setGreen(uint8 green) {
    if (@data[GREEN] != green) {
      @data[GREEN] = green 
      if (green != 0) {
        Matrix.setDot(@columns[GREEN], @rows[GREEN])
      }  else {
        Matrix.clearDot(@columns[GREEN], @rows[GREEN])
      }
    }
  }

  public uint8 getBlue() { return @data[BLUE]}

  public setBlue(uint8 blue) {
    if (@data[BLUE] != blue) {
      @data[BLUE] = blue
      if (blue != 0) {
        Matrix.setDot(@columns[BLUE], @rows[BLUE])
      } else {
        Matrix.clearDot(@columns[BLUE], @rows[BLUE])
      }
    }
  }

}