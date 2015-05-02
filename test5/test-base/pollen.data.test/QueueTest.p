package pollen.data.test

from pollen.data import Queue{uint8, 10} as Queue10
from pollen.data import Queue{uint8, 22} as Queue22
from mcu.localhost import Write

module QueueTest {
	
	value{Queue22} q22
	value{Queue10} q10
		
	host QueueTest() {
		q22.setCapacity(33)
		q10.setCapacity(13)
	}	
		
	pollen.run() {
		uint8 i = 0
		
		Write.outs("q22 capacity: ")		
		Write.outi(q22.getCapacity())		
		Write.outs("\n")		
		
		Write.outs("q10 capacity: ")		
		Write.outi(q10.getCapacity())		
		Write.outs("\n")				

		for (i = 0; i < 13; i++) {
			Write.outs("e22: ")
			if (q22.enqueue(5 + i)) {
				Write.outi(5 + i)
				Write.outs(", ")
			} else {
				Write.outs("full, ")
			}
			
			Write.outi(q22.length())
			Write.outs("\n")			
		}
		
		for (i = 0; i < 13; i++) {
			uint8 x = q22.dequeue()
			Write.outs("d: ")
			Write.outi(x)
			Write.outs(", ")
			Write.outi(q22.length())
			Write.outs("\n")
		}
		
		for (i = 0; i < 13; i++) {
			Write.outs("e10: ")
			if (q10.enqueue(5 + i)) {
				Write.outi(5 + i)
				Write.outs(", ")
			} else {
				Write.outs("full, ")
			}
			
			Write.outi(q10.length())
			Write.outs("\n")			
		}
		
		for (i = 0; i < 13; i++) {
			uint8 x = q10.dequeue()
			Write.outs("d: ")
			Write.outi(x)
			Write.outs(", ")
			Write.outi(q10.length())
			Write.outs("\n")
		}
	}
}