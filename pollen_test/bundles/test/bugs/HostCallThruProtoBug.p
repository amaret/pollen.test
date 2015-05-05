
import HostCallComp
from HostCallComp import Led

module HostCallThruProtoBug {
  
  host HostCallThruProtoBug() {
    Led.testFunction()
  }

  pollen.run() {

  }

  pollen.shutdown() {

  }

}