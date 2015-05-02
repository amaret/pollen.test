package pollen.data.test

from pollen.data import Queue{uint8, 10} as Queue
from mcu.localhost import Write

module QueueCapacity {

	value{Queue} q
	
	pollen.run() {
		
		Write.outs("Capacity running: ")
		Write.outi(q.getCapacity())
		Write.outs("\n")
	}
}