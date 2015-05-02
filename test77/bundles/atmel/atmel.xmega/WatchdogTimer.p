
module WatchdogTimer {
  
  // This function enables the Watchdog without changing prescaler settings.
  // The Watchdog will be reset automatically.
  public enable() {
    uint8 temp = +{ WDT.CTRL | WDT_ENABLE_bm | WDT_CEN_bm }+
    +{ CCP }+ = +{ CCP_IOREG_gc }+
    +{ WDT.CTRL }+ = temp

    // Wait for WD to synchronize with new settings.
    while( +{ WDT.STATUS & WDT_SYNCBUSY_bm }+ ){  }
  }

  // This function enables the Watchdog and applies prescaler settings.
  // The Watchdog will be reset automatically.  
  public enableWithTimeout(uint8 period) {
    uint8 temp = +{ WDT_ENABLE_bm | WDT_CEN_bm | period }+
    +{ CCP }+ = +{ CCP_IOREG_gc }+
    +{ WDT.CTRL }+ = temp

    // Wait for WD to synchronize with new settings.
    while( +{ WDT.STATUS & WDT_SYNCBUSY_bm }+ ){  }
  }


  // This function disables the Watchdog without changing the prescaler settings.
  // If it is enabled at a later time, the prescaler setting can be reused.
  // Note that the Watchdog can only be disabled in Safety Level 1.
  public disable() {
    uint8 temp = +{ (WDT.CTRL & ~WDT_ENABLE_bm) | WDT_CEN_bm }+
    +{ CCP }+ = +{ CCP_IOREG_gc }+
    +{ WDT.CTRL }+ = temp
  }

  // Resets the Watchdog Timer.
  public reset() {
    +{ __asm__ ("wdr") }+
  }

}