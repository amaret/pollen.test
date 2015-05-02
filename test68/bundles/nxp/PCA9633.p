!-- 
  NXP PCA9633 LED Driver.

  This driver requires and I2C interface bound to the I2C protocol member 
 --!

package nxp

module PCA9633 {

  enum Mode {MODE1 = 0x00, MODE2 = 0x01}
  enum Channel {ONE = 0x02, TWO = 0x03, THREE = 0x04, FOUR = 0x05, GROUP = 0x06}
  const uint8 GROUPFREQ = 0x07
  const uint8 LEDOUT = 0x08
  enum Subaddress {ADDR1 = 0x09, ADDR2 = 0x0A, ADDR3 = 0x0B, ALLCALL = 0x0C}

  PCA9633() {

  }

  public setBrightness(uint8 address, uint8 channel, uint8 brightness) {

  }

  public setBlinkRate(uint8 address, uint8 rate) {

  }

  !-- Private Data & Methods --!

  writeRegister(uint8 address, uint8 register, uint8 data) {
    // i2c start condition
    // write i2c address
    // write register
    // write data
    // i2c stop condition
  }

  readRegister(uint8 address, uint8 register) {
    // TODO: implement me
  }
}