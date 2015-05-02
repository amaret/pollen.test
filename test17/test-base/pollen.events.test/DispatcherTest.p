package pollen.runtime.test

----

Simple test program for the event dispatcher

----

from pollen.runtime import Dispatcher
from pollen.runtime import Event{uint8} as Event

from mcu.localhost import Write

module DispatcherTest {

	DispatcherTest() {
		e1.setPriority(1)
		e1.setHandler(func1)
		e1.setData(11)
		
		e2.setPriority(2)
		e2.setHandler(func2)
		e2.setData(22)
		
		e3.setPriority(3)
		e3.setHandler(func3)
		e3.setData(33)
	}

	pollen.run() {
		Dispatcher.post(e1)
		Dispatcher.run()
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
		Dispatcher.run()		
	}

	value{Event} e1, e2, e3

	func1(Event id) { Write.outs("func1 "); Write.outi(id.getData()); Write.outs("\n") }

	func2(Event id) { Write.outs("func2 "); Write.outi(id.getData()); Write.outs("\n") }

	func3(Event id) { Write.outs("func3 "); Write.outi(id.getData()); Write.outs("\n") }

}
