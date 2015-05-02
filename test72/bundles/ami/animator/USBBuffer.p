
class USBBuffer {
  
  const uint16 bufsize = 1024
  uint8 buffer[bufsize]

  uint16 bufferIndex
  uint16 bufferLength
  uint16 remainingPacketLength  


  USBBuffer() {

  }

  public start() {

  }

  public uint16 send(uint8 data [], uint16 length) {

  }

  public uint16 receive(uint8 data []) {
  
  }

  public receivePacket() {

  }

  public writePacket() {

  }

  public uint8 getByte() { }

  public uint16 getWord() { }

  public writeByte(uint8 c) { }

  public write(uint8 data [], uint16 length)

  public writeNow(uint8 c) { }

  public flush() {
    
  }

}