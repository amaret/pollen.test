from mcu import Mcu

module Test_02 {
	
	pollen.reset() {
		Mcu.reset()
	}

	pollen.run() {
		+{ printf("pollen.run\n") }+
		
		Mcu.cycle()
		Mcu.wait(50000)
	}

	pollen.shutdown() {
		Mcu.shutdown()
	}
}