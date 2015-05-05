from mcu import Mcu

module Test_01 {
	
	pollen.reset() {
		Mcu.reset()
	}

	pollen.run() {
		+{ printf("pollen.run\n") }+
	}

	pollen.shutdown() {
		Mcu.shutdown()
	}
}