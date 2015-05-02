
import HostCallComp
from HostCallComp import Led

# TEST calling host functions through protocol member
# TEST host time test

module HostCallThruProtoBug {
  
  host HostCallThruProtoBug() {
    print "HostCallThruProtoBug.hostInit: enter\n"
    Led.testFunction()
    print "HostCallThruProtoBug.hostInit: exit\n"
  }

  pollen.run() {

  }

  pollen.shutdown(uint8 id) {

  }

}
