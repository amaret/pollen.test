package pollen.hardware_old

-------------------------------------------------------------------------------

Protocol definition for a microcontroller.
All Mcu modules must implement these methods.

-------------------------------------------------------------------------------

protocol Mcu {

reset()                     --- Reset the microcontroller
    shutdown()                  --- Shut down the microcontroller 
    wait(uint32 us)             --- Wait for a number of microseconds
    cycle()                     --- Wait a single cpu cycle
        uint32 getFrequency()          --- Get currently configured system frequency
        host uint32 host_getFrequency()     --- Get currently configured system frequency
        setFrequency(uint32 hz)        --- Set system frequency
        host host_setFrequency(uint32 hz)   --- Set system frequency

    }
