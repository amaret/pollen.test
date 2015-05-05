
module BootloaderIncludes {
  
  +{
      #include <avr/io.h>
      //#include <avr/wdt.h>
      //#include <avr/boot.h>
      //#include <avr/power.h>
      //#include <avr/interrupt.h>
      
      #define F_CPU 8000000
      #define F_USB 6000000

      #include "Descriptors.c"

      /* Preprocessor Checks: */
      #if !defined(__OPTIMIZE_SIZE__)
        #error This bootloader requires that it be optimized for size, not speed, to fit into the target device. Change optimization settings and try again.
      #endif
  }+

}