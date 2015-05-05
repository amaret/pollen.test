import M1
import pollen.environment
from pollen.time import TimerManager


module ImportBug {
  
  pollen.run() {
    M1.foo()
  }

  pollen.shutdown() {

  }

}