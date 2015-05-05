import pollen.environment as Bijou
from bijou.i2c import I2C

module Test0 {
  
  host new I2C.Message msg(0x00EE)
  byte data[4] = {'T', 'E', 'S', 'T'}

  pollen.run() {
    msg.setWriteBuffer(data, 4)
    msg.send()
    msg.receive(0)
  }

  pollen.shutdown() {

  }

}