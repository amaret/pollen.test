import pollen.environment as Bijou
import I2CDirect as I2C

from Bijou import Led0
from Bijou import Led1

from silabs.stk.gecko import SegmentLcd as Lcd

module I2CDirectTest {

  uint8 data[4] = {0}

  host I2C.Message msg = new I2C.Message(0x4C)

  I2CDirectTest() {
    msg.setData(data)     // set data buffer
  }

  pollen.reset() {
    Bijou.reset()
  }

  initAccel() {
    // reset chip and enable active mode
    data[0] = 0x6
    data[1] = 0x0
    data[2] = 0x1
    //data[3] = 0x0       // Sets sample rate to 120 Hz
    //data[3] = 0x1         // Sets sample rate to 64 Hz
    data[3] = 0x2         // Sets sample rate to 32 Hz
    //data[3] = 0x3         // Sets sample rate to 16 Hz

    msg.write(4)    
  }

  getXYZ() {
    data[0] = data[1] = data[2] = 0x00
    msg.addFlag(I2C.MessageFlag.NoStop).write(1)
    msg.read(3)                                       // Read XOUT, YOUT, ZOUT

    int8 x, y, z
    x = (0x20 & data[0]) ? (0x1F & data[0]) : (32 + (0x1F & data[0]))
    y = (0x20 & data[1]) ? (0x1F & data[1]) : (32 + (0x1F & data[1]))
    z = (0x20 & data[2]) ? (0x1F & data[2]) : (32 + (0x1F & data[2]))

    Lcd.writeNumber(y)
  }

  pollen.run() {
    Led0.off()
    Led1.off()    

    I2C.initialize() 
    initAccel()
    
    while (true) {
      getXYZ()
    }

    //Bijou.run()
  }

  delay() {
    volatile uint32 i = 0;

    for (i = 0; i < 100000; ) {
      i++
    }
  }
}