package pollen.hardware

protocol I2CProtocol {
  
  initialize(bool master)
  uninitialize()  
  setBusSpeed(uint8 speed)
  clearBus()
  releaseBus()
  resetBus()
  put(uint8 address, uint8 data)  
  send(uint8 address, uint8 [] data, uint16 size)
  uint8 get(uint8 address)
  uint16 receive(uint16 address, uint8 [] data, uint16 size)

}