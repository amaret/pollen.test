
import TwiMaster as Display

module DotMatrix {
  
  host uint8 MatrixAddress = 0x60

  host uint8 MatrixRows = 0
  host uint8 MatrixColumns = 0
  host uint8 frame[MatrixColumns] = {0}

  host uint8 MatrixBufferSize = 0
  host uint8 dataBuffer[MatrixBufferSize] = {0}

  // host DotMatrix() {  
  // }

  +{ ISR(TWIC_TWIM_vect) {`Display.interruptHandler`(); } }+


  DotMatrix() {
    +{PORTC.DIRSET}+ = (1 << 3)     // make matrix enable line an output
    +{PORTC.OUTSET}+ = (1 << 3)     // enable the matrix display (active high)
    Display.init()
  }

  public host setDimensionsOnHost(uint8 columns, uint8 rows) {
    MatrixColumns = columns
    if (rows > 8) { 
      print "This DotMatrix module does not support more than 8 rows" 
    } else {
      MatrixRows = rows
      MatrixBufferSize = (MatrixColumns*2) + 2
    }
  }

  public bool setBrightness(uint8 level) {
    if (level > 16) { return false }
    dataBuffer[0] = 0x0D
    dataBuffer[1] = level
    Display.write(MatrixAddress, dataBuffer, 2)
  }

  public bool setDot(uint8 column, uint8 row) {
    if (column > MatrixColumns) { return false }
    if (row > MatrixRows)       { return false }
    frame[column-1] |= (1 << (row-1))
    return true
  }

  public bool clearDot(uint8 column, uint8 row) {
    if (column > MatrixColumns) { return false }
    if (row > MatrixRows)       { return false }
    frame[column-1] &= ~(1 << (row-1))
    return true
  }

  public bool setAll() {
    for(uint8 i = 0; i < MatrixColumns; i++) {
      frame[i] = 0xFF
    }
    return true
  }

  public blank() {
    for (uint8 i = 0; i < MatrixColumns; i++) {
      frame[i] = 0
    }
  }

  public update() {
    uint8 i = 0, j = 0

    for (i = 0; i < MatrixColumns; i++) {
      dataBuffer[j] = i + 1
      dataBuffer[j+1] = frame[i]
      j += 2
    }

    dataBuffer[MatrixBufferSize-2] = 0x0C
    dataBuffer[MatrixBufferSize-1] = 0x00

    Display.write(MatrixAddress, dataBuffer, MatrixBufferSize)

    // +{ printf("{") }+
    // for (i = 0; i < MatrixBufferSize; i++) {
    //   +{ printf("0x%x, ", `dataBuffer`[i]) }+
    // }
    // +{ printf("}\n") }+

  }

}