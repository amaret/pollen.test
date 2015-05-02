
from pollen.runtime import Event{uint8} as Event

from mcu.localhost import Write

module EventTest {

	value{Event} e
		
	pollen.run() {
		e.setPriority(1)
		e.setHandler(func)
		e.setData(99)
		e.handle()
		
		e.setPriority(2)
		e.setHandler(func2)
		e.setData(23)
		e.handle()
		
		e.setPriority(3)
		e.setHandler(func)
		e.setData(12)
		e.handle()

		e.setPriority(4)
		e.setHandler(func2)
		e.setData(139)
		e.handle()
	}
	
	func(Event e) {
		Write.outs("FUNC ")	
		Write.outi(e.getData())
		Write.outs("\n")		
	}
	
	func2(Event e) {
		Write.outs("FUNC2 ")	
		Write.outi(e.getData())
		Write.outs("\n")		
	}	

}