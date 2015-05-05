

module RawTwi4 {
    
  +{ 
    #include <avr/io.h> 
    #include <avr/interrupt.h>
  }+

  const uint8 SlaveAddress = 0x60
  host uint32 CpuSpeed = 2000000
  host uint32 BaudRate = 100000

  class MatrixLed {

    enum Color {RED = 0, GREEN = 1, BLUE = 2}
    host uint8 rows[3]
    host uint8 columns[3]
    uint8 data[3]

    public host MatrixLed(uint8 rCol, uint8 rRow, uint8 gCol, uint8 gRow, uint8 bCol, uint8 bRow) {
      columns[Color.RED] = rCol
      rows[Color.RED] = rRow
      columns[Color.GREEN] = gCol
      rows[Color.GREEN] = gRow
      columns[Color.BLUE] = bCol
      rows[Color.BLUE] = bRow
    }

  }

  host MatrixLed leds[8] = { new MatrixLed(1, 1, 2, 1, 3, 1), // Row 1, Cols 1, 2, 3
                          new MatrixLed(4, 1, 5, 1, 6, 1), // Row 1, Cols 4, 5, 6
                          new MatrixLed(1, 2, 2, 2, 3, 2), // Row 2, Cols 1, 2, 3
                          new MatrixLed(4, 2, 5, 2, 6, 2), // Row 2, Cols 4, 5, 6
                          new MatrixLed(1, 3, 2, 3, 3, 3), // Row 3, Cols 1, 2, 3
                          new MatrixLed(4, 3, 5, 3, 6, 3), // Row 3, Cols 4, 5, 6
                          new MatrixLed(1, 4, 2, 4, 3, 4), // Row 4, Cols 1, 2, 3 
                          new MatrixLed(4, 4, 5, 5, 6, 4) } // Row 4, Cols 4, 5, 6 

  pollen.run() {
    volatile uint32 i = 0
    uint8 addr = (SlaveAddress << 1)

    hardwareInit()

    for(i = 0; i < 10000; ) { i++ }               

    setLed(0)

    while(true) {

      ledToggle()
    }
  }

  setLed(uint8 led) {
    volatile uint8 i = 0
    uint8 rowVal = 0
    MatrixLed l = null
    l = leds[led]

    +{ TWIC.MASTER.ADDR }+ = ((SlaveAddress << 1) & ~0x01)
    for(i = 0; i < 5; ) { i++ }               

    for(uint8 j = 0; j < 3; j++) {      
      rowVal = (1 << l.rows[0]) | (1 << l.rows[1]) | (1 << l.rows[2])
      +{TWIC.MASTER.DATA}+ = l.columns[j]   // select column
      for(i = 0; i < 10; ) { i++ } 
      +{TWIC.MASTER.DATA}+ = rowVal            // set row value
      for(i = 0; i < 10; ) { i++ } 
    }

    +{TWIC.MASTER.DATA}+ = 0x0C 
  }

  hardwareInit() {
    +{PORTB.DIRSET}+ = (1 << 3) // make led pin output
    ledOff()

    +{PORTC.DIRSET}+ = (1 << 3) // make led matrix shutdown pin output
    matrixEnable()

    twimInit()
  }

  twimInit() {
    uint8 reg = 0

    +{ #define TWI_BAUD(F_SYS, F_TWI) ((F_SYS / (2 * F_TWI)) - 5) }+
    reg = +{ TWI_BAUD(`CpuSpeed`, `BaudRate`); }+

    +{ TWIC.MASTER.CTRLA = TWI_MASTER_ENABLE_bm }+ //TWI_MASTER_INTLVL_LO_gc | TWI_MASTER_RIEN_bm | TWI_MASTER_WIEN_bm | TWI_MASTER_ENABLE_bm }+
    +{ TWIC.MASTER.BAUD }+ = reg
    +{ TWIC.MASTER.STATUS }+ = +{ TWI_MASTER_BUSSTATE_IDLE_gc }+
  }


  matrixDisable() {
    +{PORTC.OUTCLR}+ = (1 << 3)
  }

  matrixEnable() {
    +{PORTC.OUTSET}+ = (1 << 3)
  }

  ledOn() {
    +{PORTB.OUTCLR}+ = (1 << 3)
  }

  ledOff() {
   +{PORTB.OUTSET}+ = (1 << 3)
  }

  ledToggle() {
    +{PORTB.OUTTGL}+ = (1 << 3)
  }

}