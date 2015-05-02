package pollen.hardware

!----------------------------------------------------------
  Protocol definition for a microcontroller. 
  All Mcu modules must implement these methods.
----------------------------------------------------------!

protocol McuCore {

  reset()                             # Reset the microcontroller
  shutdown()                          # Shut down the microcontroller   

  setFrequency(uint32 hz)             # Set system frequency 
  host setFrequencyOnHost(uint32 hz)  # Set system frequency at configuration time

  uint32 getFrequency()               # Get currently configured system frequency 
  host uint32 getFrequencyOnHost()    # Get currently configured system frequency at configuration time
     
  wait(uint16 us)                     # Wait for a number of microseconds 
  cycle()                             # Wait a single cpu cycle 
  
}
