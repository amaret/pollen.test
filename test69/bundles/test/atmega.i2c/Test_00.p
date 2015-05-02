from atmel.atmega import ATmega328 as Mcu
from Mcu import I2C


module Test_00 {
  
    host Test_00() {
      Mcu.setFrequencyOnHost(16000000)
      I2C.setMasterMode(100000)           // master mode at 100kHz
    }

    pollen.run() {

    }

}