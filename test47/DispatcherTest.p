----

#TEST Simple test program for the event dispatcher
#TEST host time construct and init of queue

----

import Dispatcher
import Event{uint8} as Ev
import EventHandler{uint8} as EvHandler

module DispatcherTest implements EvHandler {

        +{ #include <stdio.h> }+
        +{ #include <stdlib.h> }+

        host new Ev e1()
        host new Ev e2()
        host new Ev e3()


	DispatcherTest() {
		e1.setPriority(1)
		e1.setHandler(handle)
		e1.setData(11)
		
		e2.setPriority(2)
		e2.setHandler(handle)
		e2.setData(22)
		
		e3.setPriority(3)
		e3.setHandler(handle)
		e3.setData(33)
	}

        public handle(uint8 data) {
                if (data == 11) {
                        +{printf("%s\n", "ev1 handler") }+
                }
                elif (data == 22) {
                        +{printf("%s\n", "ev2 handler") }+
                }
                elif (data == 33) {
                        +{printf("%s\n", "ev3 handler") }+
                }
                else {
                        +{printf("%s\n", "no valid handler") }+
                }
        }

	pollen.run() {
		Dispatcher.post(e1)
		Dispatcher.post(e2)
		Dispatcher.post(e3)
		Dispatcher.post(e2)
		Dispatcher.post(e1)
		Dispatcher.post(e3)
		Dispatcher.post(e3)
		Dispatcher.post(e2)
		Dispatcher.post(e1)

		Dispatcher.run()
		Dispatcher.run()
		Dispatcher.run()
		Dispatcher.run()
		Dispatcher.run()
		Dispatcher.run()
		Dispatcher.run()
		Dispatcher.run()
		Dispatcher.run()		

               +{ exit(0); }+
	}

}
