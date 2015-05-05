import I2C

module I2CProviderEfm32 {

  public init() {
    +{
      // #define I2C_PORT    gpioPortE // PORTE - I2C0 Location #6
      // #define I2C_SDA_PIN 12 // PE12  // EXP16
      // #define I2C_SCL_PIN 13 // PE13  // EXP15

      #define I2C_PORT    gpioPortD // PORTD - I2C0 Location #1
      #define I2C_SDA_PIN 6 // PD6 
      #define I2C_SCL_PIN 7 // PD7 

      CMU_ClockEnable(cmuClock_HFPER, true);                            // enable HF peripheral clock
      CMU_ClockEnable(cmuClock_GPIO, true);                             // enable GPIO peripheral clock
      CMU_ClockEnable(cmuClock_I2C0, true);                             // enable I2C0 peripheral clock

      // configure SDA and SCL as open drain output with pullups
      GPIO->P[I2C_PORT].MODEL = GPIO_P_MODEL_MODE6_WIREDAND | GPIO_P_MODEL_MODE7_WIREDAND;
      //GPIO->P[I2C_PORT].MODEH = GPIO_P_MODEH_MODE12_WIREDAND | GPIO_P_MODEH_MODE13_WIREDAND;
      GPIO->P[I2C_PORT].DOUTSET = (1 << I2C_SCL_PIN) | (1 << I2C_SDA_PIN);    // initialize SDA and SCL high

      I2C0->IEN = 0;
      I2C0->IFC = _I2C_IFC_MASK;
      //I2C0->CTRL = I2C_CTRL_AUTOACK;    // enable auto ack
    }+
    
    setBusFrequency(400000)  // set to ~400kHz

    +{ 
      //I2C0->ROUTE = (6 << 8) | 0x3;       // Route location 6
      I2C0->ROUTE = I2C_ROUTE_LOCATION_LOC1 | I2C_ROUTE_SDAPEN | I2C_ROUTE_SCLPEN;
      I2C0->CTRL |= I2C_CTRL_EN;      // enable

      /* Clear and enable interrupt from I2C module */
      //NVIC_ClearPendingIRQ(I2C0_IRQn);
      //NVIC_EnableIRQ(I2C0_IRQn);
    }+
  }

  public enable(bool on) {
    if (on) {
      // Clear all pending interrupts
      clearAllInterrupts()

      // Enable those interrupts we are interested in throughout transfer. Notice
      // that the I2C interrupt must also be enabled in the NVIC, but that is 
      // left for an additional driver wrapper. 
      +{ I2C0->IEN = I2C_IF_NACK | I2C_IF_ACK | I2C_IF_MSTOP | I2C_IF_RXDATAV | I2C_IF_ARBLOST | I2C_IF_BUSERR }+
    } else {
      +{ I2C0->IEN = 0 }+
    }
  }

  public setBusFrequency(uint32 frequency) {
    //I2C0->CTRL |= I2C_CTRL_CLHR_STANDARD;         // 4:4 ratio
    +{ I2C0->CTRL |= I2C_CTRL_CLHR_ASYMMETRIC }+    // 6:3 ratio
    //    +{ I2C0->CLKDIV = 2 }+                          // Gets close to 400kHz
    +{ I2C0->CLKDIV = 1 }+                          // Gets close to 400kHz    
  }

  public stop() {
    +{ I2C0->CMD = I2C_CMD_STOP }+
  }

  public start() {
    +{ I2C0->CMD = I2C_CMD_START }+ 
  }

  public bool hasData() {
    return +{ I2C0->IF & I2C_IF_RXDATAV }+ != 0
  } 

  public ack() {
    +{ I2C0->CMD = I2C_CMD_ACK }+
  }

  public nack() {
    +{ I2C0->CMD = I2C_CMD_NACK }+
  }

  public put(byte data) {
    +{ I2C0->TXDATA }+ = data
  }

  public byte get() {
    byte x = +{ I2C0->RXDATA }+  
    return x
  }

  public uint8 getErrors() {
    uint32 pending = +{ I2C0->IF }+
    uint8 ret = 0

    if (pending & +{ I2C_IF_ARBLOST }+) {
      // If arbitration fault, it indicates either a slave device not responding
      // as expected, or other master which is not supported by this SW.
      ret |= I2C.TransferResult.ArbitrationLost
    }
    
    if (pending & +{ I2C_IF_BUSERR }+) {
      // A bus error indicates a misplaced start or stop, which should not occur
      // in master mode controlled by this SW.
      ret |= I2C.TransferResult.BusError
    }
    
    return ret
  }

  public abort() {
    // Check if in busy state, issue an abort. The BUSY state is normal after a reset. 
    if ( +{I2C0->STATE & I2C_STATE_BUSY}+ ) {
      +{ I2C0->CMD = I2C_CMD_ABORT }+
    }
  }

  public flush() {
    +{ I2C0->CMD = I2C_CMD_CLEARPC | I2C_CMD_CLEARTX }+

    if ( +{I2C0->IF & I2C_IF_RXDATAV}+ ) {
      +{ (void)I2C0->RXDATA }+
    }
  }

  // Interrupt Functions ///////////////////////////////////////

  public bool gotNack() {
    return +{ (I2C0->IF & I2C_IF_NACK) }+ != 0
  }

  public clearNack() {
    +{ I2C0->IFC = I2C_IFC_NACK }+
  }

  public bool gotAck() {
    return +{ (I2C0->IF & I2C_IF_ACK) }+ != 0
  }

  public clearAck() {
    +{ I2C0->IFC = I2C_IFC_ACK }+
  }

  public bool gotStop() {
    return +{ (I2C0->IF & I2C_IF_MSTOP) }+ != 0
  }

  public clearStop() {
    +{ I2C0->IFC = I2C_IFC_MSTOP }+
  }

  clearAllInterrupts() {   
    +{ I2C0->IFC = _I2C_IFC_MASK }+     
  }

}


