!-----------------------------------------------------------------------------
  Basic environment for the arduino duemilanove.
 
  The environment is a composition which extends the Duemilanove board 
  composition. It configures the application lifecycle and other important 
  modules necessary for supporting the app. (later, event system, timers etc.)
 -----------------------------------------------------------------------------!

package arduino.environments

from pollen.hardware import Environment
from arduino.boards import Duemilanove as Board
import Lifecycle

composition Duemilanove extends Board implements Environment {

  host Duemilanove() {
    Lifecycle.Env := Duemilanove  # We want to bind 'this composition' to the protocol member 'Lifecycle.Env' i.e. @
  }

  export Mcu.wait         # Spin the processor for a specified number of microseconds
  export Mcu.cycle        # Wait a single cpu cycle

}
