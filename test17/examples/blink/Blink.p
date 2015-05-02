from cc.arduino import Environment as Env

from Env import Led

module Blink {

	pollen.run() {
		while (true) {
			Led.toggle()
			Env.wait(500000)
		}
	}
	
	pollen.reset() { Env.reset() }
}