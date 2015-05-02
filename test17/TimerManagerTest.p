
from distro.arduino import Distro
from Distro import Mcu
# TEST Timers, with array dclns and references
# TEST lvalue (&null) bug

from pollen.time import TimerManager

module TimerManagerTest {

        host new TimerManager.Timer t()
        //value{TimerManager.Timer} t

        public host TimerManagerTest() {
                t.init()
        }

pollen.run() {
        Mcu.reset()

        while(true) {

        }
   }
}
