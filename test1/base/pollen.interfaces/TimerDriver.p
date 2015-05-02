package pollen.interfaces

import Handler

protocol TimerDriver {

	setHandler(Handler.handle h = null)

	# host setHandler(Handler.handle h = null)
		
	start()

    stop()
	    
    bool running()
    
}
