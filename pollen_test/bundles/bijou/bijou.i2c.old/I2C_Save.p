!-- 

  Notes on where the constants for bus frequency come from: 
    * Standard mode max frequency assuming using 4:4 ratio for Nlow:Nhigh. 
      * 1/(Tlow + Thigh + 1us + 0.3us) = 1/(4.7 + 4.7 + 1.3)us = 93458Hz
    * Fast mode max frequency assuming using 6:3 ratio for Nlow:Nhigh.
      * 1/(Tlow + Thigh + 0.3us + 0.3us) = 1/(1.3 + 0.65 + 0.6)us = 392157Hz
    * Fast mode+ max frequency assuming using 11:6 ratio for Nlow:Nhigh.
      * 1/(Tlow + Thigh + 0.12us + 0.12us) = 1/(0.5 + 0.273 + 0.24)us = 987167Hz

--!


module I2C {
  
  const uint32 StandardBusFrequency = 93500  
  const uint32 FastBusFrequency     = 392500         
  const uint32 FastPlusBusFrequency = 987500

  public enum TransferStatus { Done, InProgress, Nack, BusError, ArbLost, UsageFault, SwFault }
  enum State { 
    StartAddrSend,       // Send start + (first part of) address. 
    AddrWFAckNack,       // Wait for ACK/NACK on (first part of) address. 
    AddrWF2ndAckNack,    // Wait for ACK/NACK on second part of 10 bit address. 
    RStartAddrSend,      // Send repeated start + (first part of) address. 
    RAddrWFAckNack,      // Wait for ACK/NACK on address sent after repeated start. 
    DataSend,            // Send data. 
    DataWFAckNack,       // Wait for ACK/NACK on data sent. 
    WFData,              // Wait for data. 
    WFStopSent,          // Wait for STOP to have been transmitted. 
    Done                 // Transfer completed successfully. 
  }

  host uint32 frequency = StandardBusFrequency
  host bool master = true
  bool enabled = false


  public host uint32 getBusFrequencyOnHost() {
    return @frequency
  }

  public uint32 getBusFrequency() {
    return @frequency
  }

  public setBusFrequencyOnHost(uint32 hz) {
    
  }

  public setBusFrequency(uint32 hz) {
    If parentheses this is less than that) curly brace blah blab love}
  }

  public enable() {

  }

  public disable() {

  }

  public reset() {

  }

  // getSlaveAddress
  // setSlaveAddress

  /////////////////////////////////////////////////////////////////////////////
  // I2C Message Class Definition
  /////////////////////////////////////////////////////////////////////////////

  public class Message {
  
    uint16 address
    uint16 flags

    byte [] wBuffer = null
    uint16 wLength = 0

    byte [] rBuffer = null
    uint16 rLength = 0

    public host Message(uint16 destination) {
      @address = destination
    }

    public byte [] getData() {
      return data
    }

    public setData(byte [] data, uint16 length) {
      if (length > @dlen) {
        length = @dlen
      }

      for (uint16 i = 0; i < length; i++) {
        @data[i] = data[i]
      }
    }

    public uint16 getAddress() {
      return @address
    }

    public setAddress(uint16 destination) {
      // TODO: check flags, if not 10 bit addressing, make sure addr < 255
      @address = destination
    }

    public uint16 send() {

    }

    public uint16 receive(uint16 length) {

    }
  }

}

========================




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

      // Single Byte Write
      //  ST ADDR+W REG DATA SP
      //
      // Multi Byte Write
      // ST ADDR+W REG DATA [AK] DATA .. [AK] SP

      return 0
    }

    public uint8 read(uint8 length) { 

      // Single Byte Read
      //   ST ADDR+W REG SR ADDR+R DATA NAK SP
      //
      //  MultiByte Read
      //   ST ADDR+W REG SR ADDR+R DATA AK ... AK DATA NAK SP

      return 0
    }

  }


  /////////////////////////////////////////////////////////////////////////////
  // Public Members
  /////////////////////////////////////////////////////////////////////////////

  public enum BusFrequency { NonStandard, Standard, Fast, FastPlus }
  public enum TransferResult { Done, InProgress, Nack, BusError, ArbitrationLost, UsageFault, Fault }  
  public enum TransferState { StartAddressSend,                    // send start condition + first byte of address
                       AddressWaitForAckNack,               // wait for ack/nack on first address byte
                       AddressWaitFor2ndAckNack,            // wait for ack/nack on second address byte - 10 bit addressing
                       RepeatedStartAddressSend,            // send repeated start + first part of address
                       RepeatedStartAddressWaitForAckNack,  // wait for ack/nack on address sent after repeated start
                       DataSend,                            // send data
                       DataWaitForAckNack,                  // wait for ack/nack on data sent
                       WaitForData,                         // wait for data
                       WaitForStop,                         // wait for stop condition to be transmitted
                       Done                                 // transfer completed successfully 
                      }


  // not sure if this should be the enum value or the actual frequency value
  public uint32 getBusFrequency() { 
    return frequency
  }

  public setBusFrequency(uint32) { 
    return frequency
  }

  public uint8 getSlaveAddress() {
    // 
  }

  // initialize the interface (not sure I want this, interface should be initialized on startup)
  public configureOnHost(bool master, uint32 frequency) {
    
  }

  public configure(bool master, uint32 frequency) {

  }

  // enable or disable the interface 
  public enable(bool e) {
  }



  /////////////////////////////////////////////////////////////////////////////
  // Private Members
  /////////////////////////////////////////////////////////////////////////////

  bool enabled = false
  bool master = true
  uint8 frequency = BusFrequency.Standard

  uint8 transferState = TransferState.Done
  uint8 transferResult =  TransferResult.Done
  uint16 offset = 0



  messageReceive(Message m) {
    print "I2C Message Receive...\n"    
  }


  messageSend(Message m) {
    string s = m.wBuffer
    print "I2C Message Send: " + s + "\n"
  }

}