
module EnumWithComments {
  
  enum Status { OK = 0,             // Operation succeeded
                ERROR = 1,          // Unspecified error
                UNSUPPORTED = 2,    // Operation not supported
                NOSLAVE = 3,        // Slave not responding
                BUSBUSY = 4 }       // Communication ongoing on the bus

  enum BusSpeed { LOW = 0,          // 10kHz
                  STANDARD = 1,     // 100kHz
                  FAST = 2,         // 400kHz
                  FASTPLUS = 3 }    // 1MHz


  pollen.run() {
  
  }
}