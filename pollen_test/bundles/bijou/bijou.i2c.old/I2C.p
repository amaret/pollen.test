// PB10 (SCL), PB11 (SDA)  - 24AA024 EEPROM
// PB9 - WP (low to disable, has pullup)



module I2C {

  // This class needs to be made public. 
  class Message {
  
    uint8 address

    byte wBuffer [] = null
    uint16 wLength = 0

    byte rBuffer [] = null
    uint16 rLength = 0

    bool rstart = false

    public host Message(uint8 destination, writeBuffer, writeBufferLength, readBuffer, readBufferLength) {
      @address = destination
      @wBuffer = writeBuffer
      @wLength = writeBufferLength
      @rBuffer = readBuffer
      @rLength = readBufferLength
    }

    public uint16 getAddress() {
      return @address
    }

    public sendRepeatedStart(bool send) {
      @rstart = send
    }

    public uint8 write(uint8 length) {

      return 0
    }

    public uint8 read(uint8 length) { 

      return 0
    }

  }


  /////////////////////////////////////////////////////////////////////////////
  // Public Members
  /////////////////////////////////////////////////////////////////////////////


  public setBusFrequency(uint32) { 
    
  }

  public uint32 getBusFrequency() { 
    return frequency
  }

  // initialize the interface (not sure I want this, interface should be initialized on startup)
  public configureOnHost(bool master, uint32 frequency) {
    
  }

  public configure(bool master, uint32 frequency) {

  }


  /////////////////////////////////////////////////////////////////////////////
  // Private Members
  /////////////////////////////////////////////////////////////////////////////

  host uint32 frequency = 100000     // 100kHz standard-mode
  bool master = true
  bool enabled = false

  i2c_enable() {

    CMU_ClockEnable(cmuClock_I2C0, true);
    GPIO_PinModeSet(I2C_PORT, I2C_SDA_PIN, gpioModeWiredAnd, 0);      // configure SDA pin as open drain output
    GPIO_PinModeSet(I2C_PORT, I2C_SCL_PIN, gpioModeWiredAnd, 0);      // configure SCL pin as open drain output

    /* Configure I2C - Fast mode (400kHz) Master */
    I2C0->CTRL = (1 << 8) | (1 << 2) | (1 << 0);      // enable I2C, 6:3 ratio, auto ack enabled
    I2C0->CMD = (7 << 5);                             // clear pending commands, clear TX buffer and shift reg, issue abort to clear bus busy bit
    I2C0->CLKDIV = 2;                                 // generates 400kHz clock with 6:3 ratio
    i = I2C0->RXDATA;                                 // flush RX buffer
    I2C0->IFC = 0x1FFCF;                              // clear interrupt flags (optional)
    I2C0->ROUTE = (6 << 8) | 0x3;                     // use location #6 (PE11, PE12), enable SDA and SCL


  }

  i2c_start () {
    +{ I2C0->CMD = I2C_CMD_START }+
  }

  i2c_stop () {
   +{ I2C0->CMD = I2C_CMD_STOP }+
  }

  i2c_put(byte b) {
    while(!(+{ I2C0->STATUS & I2C_STATUS_TXBL }+)) { }       // wait for TX buffer to empty
    +{ I2C0->TXDATA }+ = b                            // write byte to TX buffer
  }

  // returns 0 on success (ack), non-0 on failure (nack)
  bool i2c_read(Message msg, uint8 length, bool repeatStart) {
   
    if (+{ I2C0->STATUS & I2C_STATUS_RXDATAV }+) {      // flush buffer if needed 
      uint8 x = +{ I2C0->RXDATA }+
    }

    while (+{I2C0->STATE & I2C_STATE_BUSY}+) { }        // wait for bus to become idle 
    i2c_start()
    i2c_put(msg.address << 1 | 0x01)                           // send slave address (R/W bit set to 0, write)
    if(check_for_nack(0)) { return false }              // wait for slave to ack, return on addr nack error


  }

  //
  // returns true on success (ack), false on failure (nack)
  //
  bool i2c_write(Message msg, uint8 length, bool repeatStart) {
    while (+{I2C0->STATE & I2C_STATE_BUSY}+) { }    // wait for bus to become idle 
    i2c_start()                                     // send START command 
    i2c_put(msg.address << 1)                       // send slave address (R/W bit set to 0, write)
    if(check_for_nack(0)) { return false }          // wait for slave to ack, return on addr nack error

    for (uint8 i = 0; i < length; i++) {            
      i2c_put(msg.dout[i])                          // send each data byte over I2C   
      if(check_for_nack(1)) { return false }        // wait for slave to ack, return on data nack error
    }

    if (repeatStart == false) {                     // if not doing repeat start, send stop. 
      i2c_stop()                                    // send stop command 
    }

    return true
  }


  // This function checks for an expected acknowledge signal based on the 
  // message type (READ/WRITE) and byte number (ADDR/DATA) 
  // 0 == addr nack error
  // 1 == Write data nack error
  // 2 == Read nack error
  // Return: 
  //    0 for Ack received
  //    1 for NACK received
  //    2 for unsupported ACK type
  uint8 check_for_nack(uint8 ack_type) {
   
    if (ack_type == 0) {
      while (!( +{(I2C0->STATE >> 4)}+ == 0x9)) { }             // wait for address ACK/NACK and bushold, check for timeout (optional)
      if (+{I2C0->STATE & I2C_STATE_NACKED}+ ) { return 1  }    // nack received
      else { return 0 }                                         // ack received

    } elif (ack_type == 1) {
      while (!((I2C0->STATE >> 4) == 0xD)) { }                  // wait for data ACK/NACK and bushold, check for timeout (optional)
      if (I2C0->STATE & I2C_STATE_NACKED) { return 1 }          // nack received, handle NACK: lost communication
      else { return 0 }                                         // ack received

    } elif (ack_type == 2) {
      while (!((I2C0->STATE >> 4) == 0xC)) { }                  // wait for data ACK/NACK (no bushold), check for timeout (optional)
      if (I2C0->STATE & I2C_STATE_NACKED) { return 1 }          // Handle NACK: lost communication, nack received        
      else { return 0 }                                         // ack received

    } else {      
      return 2                                                  // unsupported ack type 
    }
  }


}