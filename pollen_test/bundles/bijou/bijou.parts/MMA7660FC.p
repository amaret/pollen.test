!-- 
 
  Freescale MMA7660FC 3-Axis Orientation / Motion Detection Sensor Driver

  The MMA7660FC is a ±1.5 g 3-Axis Accelerometer with Digital Output (I2C). 
  It is a very low power, low profile capacitive MEMS sensor featuring a low 
  pass filter, compensation for 0g offset and gain errors, and conversion to 
  6-bit digital values at a user configurable samples per second.

--!

from bijou.i2c import I2C

module MMA7660FC {
  
  public enum Mode { Standby, Active, Test = 0x04, AutoWake = 0x08, AutoSleep = 0x10, SCPS = 0x20, IPP = 0x40, IAH = 0x80 }
  public enum SampleRate { Hz120, Hz64, Hz32, Hz16, Hz8, Hz4, Hz2, Hz1 }
  public enum Register { XOUT, YOUT, ZOUT, TILT, SRST, SPCNT, INTSU, MODE, SR, PDET, PD }

  host I2C.Message msg = new I2C.Message(address)
  byte data[4] = {0}

  host uint8 address = 0x4C
  host uint8 sampleRate = SampleRate.Hz32
  uint8 xyz[3] = {32, 32, 32}


  MMA7660FC() {
    msg.setData(data)
  }

  public start(uint8 rate) {
    sampleRate = rate
    data[0] = Register.INTSU
    data[1] = 0x00              // set any interrupts on / off here
    data[2] = Mode.Active       // register auto increments 
    data[3] = sampleRate
    msg.write(4)
  }

  public stop() {
    data[0] = Register.INTSU
    data[1] = 0x00              // clear all interrupts
    data[2] = Mode.Standby      // go into standby mode
    msg.write(2)
  }

  public setSampleRate(uint8 rate) {
    sampleRate = rate
    data[0] = Register.SR
    data[1] = sampleRate
    msg.write(2)
  }

  public setMode(uint8 mode, bool set) {
    data[0] = Register.MODE
    data[1] = set ? (1 << mode) : 0
    msg.write(2)
  }

  public getXYZ(uint8 [] data) {
    readXYZ()

    data[0] = xyz[0]
    data[1] = xyz[1]
    data[2] = xyz[2]
  }

  //////////////////////////////////
  // Private methods 
  //////////////////////////////////

  readXYZ() {
    data[0] = Register.XOUT     // XOUT = 0, so we don't reset it when reading
    data[1] = data[2] = 0x00
    msg.addFlag(I2C.MessageFlag.NoStop).write(1)
    msg.read(3)                                       // Read XOUT, YOUT, ZOUT

    xyz[0] = (0x20 & data[0]) ? 0x1F & data[0] : (0x1F & data[0]) + 32      // Get values from 0 to 64
    xyz[1] = (0x20 & data[1]) ? 0x1F & data[1] : (0x1F & data[1]) + 32      // Get values from 0 to 64
    xyz[2] = (0x20 & data[2]) ? 0x1F & data[2] : (0x1F & data[2]) + 32      // Get values from 0 to 64

  }

  ////
  // OrientationDetection
  // TapDetectino
  // ShakeDetection
  // AutoWake - AutoSleep

}
