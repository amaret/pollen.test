from pollen.hardware import I2CProtocol


module TWI1 implements I2CProtocol {
  
  public initialize(bool master) { 

  }

  public uninitialize() { 

  }
  
  public setBusSpeed(uint8 speed) { 

  }
  
  public clearBus() { 

  }
  
  public releaseBus() { 

  }
  
  public resetBus() { 

  }
  
  public put(uint8 address, uint8 data) { 

  }
  
  public send(uint8 address, uint8 [] data, uint16 size) { 

  }
  
  public uint8 get(uint8 address) { 
    return 0
  }
  
  public uint16 receive(uint16 address, uint8 [] data, uint16 size) { 
    return 0
  }
  

}