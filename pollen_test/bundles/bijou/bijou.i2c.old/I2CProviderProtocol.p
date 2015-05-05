

module I2CProviderProtocol {
  
  public uint32 getBusFrequency()

  public setBusFrequency(uint32)

  public uint8 getSlaveAddress()

  public setSlaveAddress(uint16 address)

}



public setFrequency (uint16 hz)

// returns 0 on success (ack), non-0 on failure (nack)
public uint16 read (uint16 address, byte [] data, uint16 length, bool repeated)

// ack indicates if the byte is to be acknowledged (true = acknowledge)
public uint8 get (bool ack)

// 0 on success (ack), non-0 on failure (nack)
public uint16 write (uint16 address, byte [] data, uint16 length, bool repeated)

// Returns true if an ACK was received, false otherwise
public bool put (uint8 data)

public start () {

}

public stop () {
  
}