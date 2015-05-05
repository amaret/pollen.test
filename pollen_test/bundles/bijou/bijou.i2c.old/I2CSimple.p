
module I2CSimple {
  



  public setFrequency (uint16 hz) {

  }


  public start() {
    +{ I2C0->CMD = I2C_CMD_START }+
  }

  public stop() {
    +{ I2C0->CMD = I2C_CMD_STOP }+
  }


  // returns 0 on success (ack), non-0 on failure (nack)
  public uint16 read (uint16 address, byte [] data, uint16 length, bool repeatStart) {

  }

  // 0 on success (ack), non-0 on failure (nack)
  public uint16 write (uint16 address, byte [] data, uint16 length, bool repeatStart) {

  }




  public put(byte b) { }

  public byte get() { }



}