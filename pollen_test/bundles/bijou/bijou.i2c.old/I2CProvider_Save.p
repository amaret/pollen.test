

module I2CProvider {
  

  // Lookup table for Nlow + Nhigh setting defined by CLHR. Set undefined index (0x3) to reflect default setting just in case.
  const uint8 [] i2cNSum = { 4 + 4, 6 + 3, 11 + 6, 4 + 4 }

  // Clock low to high ratio settings.
  enum ClockHLR {
    Standard  = _I2C_CTRL_CLHR_STANDARD,      // Ratio is 4:4 
    Asymetric = _I2C_CTRL_CLHR_ASYMMETRIC,    // Ratio is 6:3 
    Fast      = _I2C_CTRL_CLHR_FAST           // Ratio is 11:3 
  } 

  host uint8 clockRatio = ClockHLR.Standard


  public initialize(bool master, uint32 frequency) {
    +{ I2C0->IEN = 0 }+
    +{ I2C0->IFC = _I2C_IFC_MASK }+
    +{ BITBAND_Peripheral(&(I2C0->CTRL), _I2C_CTRL_SLAVE_SHIFT, `master` ? 0 : 1) }+
    setBusFrequency(frequency)
    enable(true)
  }

  public uint32 getBusFrequency() {
    uint32 hfperclk
    uint32 n

    // Max frequency is given by fSCL = fHFPERCLK/((Nlow + Nhigh)(DIV + 1) + 4) 
    hfperclk = +{ CMU_ClockFreqGet(cmuClock_HFPER) }+
    n        = i2cNSum[ +{(I2C0->CTRL & _I2C_CTRL_CLHR_MASK) >> _I2C_CTRL_CLHR_SHIFT}+ ]

    return (hfperclk / ((n * (i2c->CLKDIV + 1)) + 4))
  }

  public uint32 setBusFrequency(uint32 hz) {
    uint32 n
    uint32 div

    // Set the CLHR (clock low to high ratio).
    +{ I2C0->CTRL &= ~_I2C_CTRL_CLHR_MASK }+
    +{ I2C0->CTRL |= clockRatio <<_I2C_CTRL_CLHR_SHIFT }+

    // Frequency is given by fSCL = fHFPERCLK/((Nlow + Nhigh)(DIV + 1) + 4), thus 
    // DIV = ((fHFPERCLK - 4fSCL)/((Nlow + Nhigh)fSCL)) - 1 
    refFreq = +{ CMU_ClockFreqGet(cmuClock_HFPER) }+
    n = i2cNSum[clockRatio]
    div = (refFreq - (4 * hz)) / (n * hz)

    // Clock divisor must be at least 1 in slave mode according to reference
    // manual (in which case there is normally no need to set bus frequency). 
    if (+{(I2C0->CTRL & I2C_CTRL_SLAVE)}+ && !div) {
      div = 1
    }

    +{ EFM_ASSERT(div <= _I2C_CLKDIV_DIV_MASK) }+
    +{ I2C0->CLKDIV }+ = div;
  }

  public enable(bool state) {
    +{ BITBAND_Peripheral(&(I2C0->CTRL), _I2C_CTRL_EN_SHIFT, `state`) }+
  }

  public reset() {
    +{ I2C0->CTRL      = _I2C_CTRL_RESETVALUE }+
    +{ I2C0->CLKDIV    = _I2C_CLKDIV_RESETVALUE }+
    +{ I2C0->SADDR     = _I2C_SADDR_RESETVALUE }+
    +{ I2C0->SADDRMASK = _I2C_SADDRMASK_RESETVALUE }+
    +{ I2C0->IEN       = _I2C_IEN_RESETVALUE }+
    +{ I2C0->IFC       = _I2C_IFC_MASK }+
    // Do not reset route register, setting should be done independently
  }

  // Read from an I2C slave. 
  public uint16 readFrom(uint16 address, byte [] data, uint16 length, bool repeated) {

  }

  // Read a single byte from the I2C bus.
  public byte get(bool ack) {

  }

  // Write to an I2C slave
  public uint16 writeTo(uint16 address, byte [] data, uint16 length, bool repeated) {

  }

  // Write single byte out on the I2C bus.
  public bool put(byte data) {

  }

  // Creates a start condition on the I2C bus. 
  public start() {

  }

  // Creates a stop condition on the I2C bus. 
  public stop()  {

  }


  transfer() {

    // Check if in busy state. Since this SW assumes single master, we can */
    // just issue an abort. The BUSY state is normal after a reset. */
    if (i2c->STATE & I2C_STATE_BUSY) {
      i2c->CMD = I2C_CMD_ABORT;
    }

    /* Make sure user is not trying to read 0 bytes, it is not */
    /* possible according to I2C spec, since slave will always start */
    /* sending first byte ACK on address. The read operation can */
    /* only be stopped by NACKing a received byte, ie minimum 1 byte. */
    if (((seq->flags & I2C_FLAG_READ) && !(seq->buf[0].len)) ||
        ((seq->flags & I2C_FLAG_WRITE_READ) && !(seq->buf[1].len))
        ) {
      return(i2cTransferUsageFault);
    }


  }

}