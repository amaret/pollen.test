!-----------------------------------------------------------------------------
  Basic environment for the arduino uno.
 
  The environment is a composition which extends the Uno board composition. 
  It configures the application lifecycle and other important modules 
  necessary for supporting the app. (later, event system, timers etc.)
 -----------------------------------------------------------------------------!

package arduino.uno

from pollen.hardware import Environment as Env

import Board
from Board import Mcu
from Board import Led
from Board import Digital13

composition EnvironmentSimple implements Env {

  host Environment() {
  }

  export Mcu
  export Mcu.wait         # Spin the processor for a specified number of microseconds
  export Mcu.cycle        # Wait a single cpu cycle

  export Led
  export Digital13
  
}
