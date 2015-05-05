
import TwiMaster

module TwiMasterTest {

  const uint8 MatrixAddress = 0x60

  class Point {
    uint8 column = 0
    uint8 row = 0

    public host Position(uint8 column, uint8 row) {
      @column = column
      @row = row
    }
  }

  host uint8 NumPoints = 48
  Point idMap[NumPoints] = {}


  +{ ISR(TWIC_TWIM_vect) {`TwiMaster.interruptHandler`(); } }+

  TwiMasterTest() {
    +{ PORTC.DIRSET }+ = (1 << 3)
    matrixEnable()
  }
  
  pollen.run() {

    TwiMaster.init()
    +{ _delay_ms(10) }+
    setTopRed(false)
    setTopGreen(false)
    setTopBlue(false)

    +{PMIC.CTRL}+ |= +{ PMIC_LOLVLEN_bm }+
    +{ sei() }+

    while(true) {
      setTopRed(true)
      +{_delay_ms(250)}+
      setTopRed(false)
      +{_delay_ms(250)}+
    }

  }

  setTopRed(bool on) {
    byte data[6] = {0x01, 0x03, 0x04, 0x03, 0x0C, 0x00}
    if (on == false) { data[1] = data[3] = 0x00 }
    TwiMaster.write(MatrixAddress, data, 6)
  }

  setTopGreen(bool on) {
    byte data[6] = {0x02, 0x03, 0x05, 0x03, 0x0C, 0x00}
    if (on == false) { data[1] = data[3] = 0x00 }
    TwiMaster.write(MatrixAddress, data, 6)
  }

  setTopBlue(bool on) {
    byte data[6] = {0x03, 0x03, 0x06, 0x03, 0x0C, 0x00}
    if (on == false) { data[1] = data[3] = 0x00 }
    TwiMaster.write(MatrixAddress, data, 6)
  }


  matrixEnable() {
    +{PORTC.OUTSET}+ = (1 << 3)
  }

}