// I2C_CMD_START      // Send start condition
// I2C_CMD_STOP       // Send stop condition
// I2C_CMD_ACK        // Send ACK
// I2C_CMD_NACK       // Send NACK
// I2C_CMD_CONT       // Continued transmission
// I2C_CMD_ABORT      // Abort transmission
// I2C_CMD_CLEARTX    // Clear tx
// I2C_CMD_CLEARPC    // Clear pending commands



module I2CMbed {

  //  Set the frequency of the I2C interface. 
  public setFrequency (uint16 hz) {

  }

  // Read from an I2C slave.
  public uint16 read (uint16 address, byte [] data, uint16 length, bool repeated) {

  }

  // Read a single byte from the I2C bus.
  public uint8 get (bool ack) {
    uint8 data = 0

    data = +{ I2C0->RXDATA }+

    if (ack) {
      +{ I2C->CMD = I2C_CMD_ACK }+
    }

    return data
  }

  // Write to an I2C slave
  public uint16 write (uint16 address, byte [] data, uint16 length, bool repeated) {
uint8_t i;
   
  // wait for bus to become idle */
  while(I2C0->STATE & I2C_STATE_BUSY);
   
  /* send START command */
  I2C0->CMD |= 0x1;
   
  /* write I2C slave address */
  while(!(I2C0->STATUS & (1 << 7)));   // wait for TX buffer to empty
  I2C0->TXDATA = addr << 1;            // write slave address with WRITE bit (lsb=0)
  if(check_for_nack(0)) {              // wait for slave to ack
    // handle addr nack error
  }
   
  /* write the sensor command code */
  while(!(I2C0->STATUS & (1 << 7)));   // wait for TX buffer to empty
  I2C0->TXDATA = message->com_code;    // write the command code to the sensor
  if(check_for_nack(1)) {              // wait for slave to ack
    // handle data nack error
  }
   
  /* send each data byte over I2C */
  for(i=0; i<message->byte_cnt; i++) {
    while(!(I2C0->STATUS & (1 << 7))); // wait for TX buffer to empty
    I2C0->TXDATA = message->data[i];   // send data byte to slave
    if(check_for_nack(1)) {            // wait for slave to ack
      // handle data nack error
    }
  }
   
  /* send stop command */
  I2C0->CMD |= 0x2;
  }

  // Write single byte out on the I2C bus.
  public bool put (uint8 data) {
    
    
    while (+{ I2C0->STATE & 0x1 }+) { }       // wait for bus to become idle
    start()                                   // send start condition
    +{ I2C0->TXDATA }+ = data
  }


  // Creates a start condition on the I2C bus. 
  public start () {
    +{ I2C0->CMD = I2C_CMD_START }+
  }


  // Creates a stop condition on the I2C bus.
  public stop () {
    +{ I2C0->CMD = I2C_CMD_STOP }+
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
   
    if(ack_type == 0) {
      while(!((I2C0->STATE >> 4) == 0x9)) {
        // wait for address ACK/NACK and bushold
        // check for timeout (optional)
      }
     
      if(I2C0->STATE & I2C_STATE_NACKED) {
        return 1  // nack received
      } else {
        return 0  // ack received
      }

    } else if (ack_type == 1) {

      while (!((I2C0->STATE >> 4) == 0xD)) {
        // wait for data ACK/NACK and bushold
        // check for timeout (optional)
      }
 
      if (I2C0->STATE & I2C_STATE_NACKED) {
        // Handle NACK: lost communication
        return 1 // nack received
      } else {
        return 0 // ack received
      }

    } else if (ack_type == 2) {

      while (!((I2C0->STATE >> 4) == 0xC)) {
        // wait for data ACK/NACK (no bushold)
        // check for timeout (optional)
      }
    
      if (I2C0->STATE & I2C_STATE_NACKED) {
        // Handle NACK: lost communication
        return 1 // nack received
      } else {
        return 0 // ack received
      }
    
    } else {      
      return 2   // unsupported ack type 
    }
  }


}




