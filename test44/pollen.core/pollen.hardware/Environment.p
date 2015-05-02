package pollen.hardware

!-----------------------------------------------------------------------------
  Protocol definition for a hardware environment. 
  This protocol is generally implemented by a composition.
------------------------------------------------------------------------------!

protocol Environment {

  wait(uint16 us)         # Spin the processor for a specified number of microseconds
  cycle()                 # Wait a single cpu cycle

  !-- for the future --!
  # 
  # run()                 # Run the event system 
  # post()                # Post an event
  # postFromInterrupt()   # Post an event from an interrupt
    
}