package pollen.events

----

Event Dispatcher 

----

import Event{uint8} as AE

from pollen.interfaces import GlobalInterrupts as gi
from pollen.data import Queue{uint8, 10} as AEQueue

module Dispatcher {

    // ERROR changed to call with an arg
    // as was called elsewhere with an arg
    public host bindGlobalInterrupts(gi g) {
        gi := gi
    }

	public post(AE e) { 
		bool on = gi.disable()
		AEQueue.enqueue(e)
		gi.restore(on) 
	}
	
	public postFromInterrupt(AE e) { AEQueue.enqueue(e) }

  	public run() {
        gi.enable() 		# start loop with interrupts enabled
				
		while(true) {

			# Interm dispatcher loop until the one below is installed.
			bool on = gi.disable() 		# disable interrupts
	        AE e = AEQueue.dequeue()	
			gi.restore(on) 				# re-enable interrupts
	
			if (e != null) {				
				e.handle()				# handle event
			}			
                        #Should Add This Part Soon!
			---- 
             else {
			  	pollen.hibernate()		# sleep processor
			}
			----
		}
	}
	
	
	#==================================
	# Private Members
	#==================================
    //host GlobalInterrupts gi               # protocol representative
	//new AEQueue events()                  # should be: AEQueue events()
	//AEQueue events                    # should be: AEQueue events()

}
