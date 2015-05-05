import pollen.environment as Env
from Env import Mcu

module BasicTwi {
  
  host uint32 TwiBusSpeed = 100000 
  host uint8 busBaudReg = 0

  enum BusState { UNKNOWN = 0x00, IDLE = 0x01, OWNER = 0x02, BUSY = 0x03 }

  host BasicTwi() {
    busBaudReg = (Mcu.getFrequencyOnHost() / (2 * TwiBusSpeed)) - 5
    print "Twi Bus Speed = " + TwiBusSpeed + "Hz, busBaudReg = " + busBaudReg
  }

  public init() {
    +{ TWIC.MASTER.BAUD }+ = busBaudReg   // baud register needs to be written when master is disabled 
    +{ TWIC.MASTER.CTRLA = TWI_MASTER_ENABLE_bm}+ //TWI_MASTER_INTLVL_LO_gc | TWI_MASTER_RIEN_bm | TWI_MASTER_WIEN_bm | TWI_MASTER_ENABLE_bm }+
    +{ TWIC.MASTER.STATUS }+ = BusState.IDLE
  }

  public bool busy() {
    return (+{ TWIC.MASTER.STATUS }+ & BusState.BUSY) == BusState.BUSY
  }

  public bool start(uint8 address, bool write) {
    address = address << 1
    if (write) {
      address = address & (~0x01)
    }
    +{TWIC.MASTER.ADDR}+ = address
  }

  public write(byte data) {
    +{TWIC.MASTER.DATA}+ = data
  }

  public stop() {
    +{TWIC.MASTER.CTRLC = TWI_MASTER_CMD_STOP_gc}+ 
  }


  // NOT USED BUT IN INTERFACE FROM 
  // http://www.mikroe.com/download/eng/documents/compilers/mikroc/pro/avr/help/twi_library.htm

  // public uint8 status() {
  //   return 0
  // }

  // public close() {

  // }


}