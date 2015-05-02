
// hard coded to import from a specific MCU for now, will be refactored to be more generic
import ATmega328
from ATmega328 import TwoWireInterrupt as TWInterrupt 
//from pollen.hardware import I2CProtocol

import Cpu

//implements I2CProtocol

module I2C0 {

  enum Status { OK = 0,             // Operation succeeded
                ERROR = 1,          // Unspecified error
                UNSUPPORTED = 2,    // Operation not supported
                NOSLAVE = 3,        // Slave not responding
                BUSBUSY = 4 }       // Communication ongoing on the bus

  enum BusSpeed { LOW = 0,          // 10kHz
                  STANDARD = 1,     // 100kHz
                  FAST = 2,         // 400kHz
                  FASTPLUS = 3 }    // 1MHz
      
  host bool isMaster = true
  host uint8 busSpeed = BusSpeed.STANDARD  
  host uint8 prescaler = 0
  host uint8 bitrate = 0
  
  host I2C0() {
    TWInterrupt.setHandlerOnHost(i2cISR)
  }

  I2C0() {
    initialize()
  }

  public host setMasterMode(uint32 speed) {
    isMaster = true

    if (speed == 10000) {
      busSpeed = BusSpeed.LOW
    } elif (speed == 100000) {
      busSpeed = BusSpeed.STANDARD
    } elif (speed == 400000) {
      busSpeed = BusSpeed.FAST
    } elif (speed == 1000000) {
      busSpeed = BusSpeed.FASTPLUS
    } else {
      print "Unsupported bus speed " + speed + ". Setting to Standard (100kHz).\n"
    }

    uint16 val = ((Cpu.getFrequencyOnHost() / speed) - 16) / 2

    if (val < 0) {
      uint32 freq
      print "I2C Error: Cannot support I2C speed (" + speed + ") with current MCU frequency\n" 
    } else {
      while (val < 0 || val > 255) {
        ++prescaler         // increment prescaler
        val >>= 2           // divide by 2 squared
      }
      if (prescaler > 3) {
        print "I2C ERROR: Cannot support I2C frequency (" + speed + ")"
      } else {
        bitrate = val
      }

      print "I2C0: speed=" + speed + " bitrate_val=" + val + " prescale_val=" + prescaler + "\n"
    }
  }

  public host setSlaveMode(uint32 speed) {
    isMaster = false

    // CPU clock frequency in slave mode must be at least 16 times higher than the SCL frequency
    if (Cpu.getFrequencyOnHost() < (16 * speed)) {
      print "I2C Error: MCU frequency in slave mode must be at least 16 times higher than bus speed"
    }

  }

  public initialize() { 

    // Ensure that TWI is not in power reduction
    +{PRR &= ~(1<<PRTWI)}+
    
    // Set prescale and bit rate registers
    +{TWSR}+ = prescaler
    +{TWBR}+ = bitrate

    // TWInterrupt.clear()              // clear any interrupts
    // +{TWCR}+ = (1 << +{TWEN}+)  |    // Enable TWI-interface
    //            (0 << +{TWEA}+)  |    // Release TWI pins
    //            (0 << +{TWSTA}+) |    // 
    //            (0 << +{TWSTO}+) |    // No Signal requests.
    //            (0<<TWWC)

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
  
//  public send(uint8 address, uint8 [] data, uint16 size) { 
//  }
  
//  public uint8 get(uint8 address) { 
//  }
  
//  public uint16 receive(uint16 address, uint8 [] data, uint16 size) { 
//  }
  
  i2cISR() {

  }
}