----

Event Dispatcher

----
import Event {uint8} as Evv
import Queue {Evv, uint8} as EvQueue

module Dispatcher {

    host new EvQueue myEventQueue(2)
    host public Dispatcher() {
    }

    public post(Evv e) {
        myEventQueue.add(e)
    }

    public run() {

        while(true) {

            Evv e = myEventQueue.remove()

            if (e != null && e.handle != null) {
                e.handle(e.getData())				# handle event
                break;
            }
        }
    }
}
