package pollen.events

from pollen.interfaces import GlobalInterrupts
import Dispatcher

composition Events {

    public host bindGlobalInterrupts(GlobalInterrupts gi) {
        Dispatcher.bindGlobalInterrupts(gi)
    }

    export Dispatcher.post                  # Post event
    export Dispatcher.postFromInterrupt     # Post event from interrupt context
    export Dispatcher.run                   # Run event system

}