package pollen.time

from pollen.interfaces import GlobalInterrupts
from pollen.interfaces import TimerDriver

import TimerMilli

composition Time {

        export TimerMilli

        public host bindGlobalInterrupts(GlobalInterrupts gi) {
        }

        public host bindTimerDriver(TimerDriver t) {
         TimerMilli.bindTimerDriver(t)
        }
}
