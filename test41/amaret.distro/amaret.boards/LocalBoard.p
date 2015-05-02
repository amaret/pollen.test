!----------------------------------------------------------------------------
  Board composition for your local computer.
 ----------------------------------------------------------------------------!

from amaret.local import LocalMcu
from LocalMcu import Mcu
from LocalMcu import A1

from pollen.hardware import MetaLed{false} as Led

composition LocalBoard {

  public host LocalBoard() {
    Led.pin := A1
  }
  
  export Mcu
  export Led
  export A1

}