----

Meta module for AVR Gpio

----

package mcu.atmel.atmega328p

from pollen.interfaces import Gpio

meta { string port = "", string ddr = "", uint8 pin = 0 } module GpioMeta implements Gpio {

		+{ #include <avr/io.h> }+

		public set() { +{`port`}+ |= (1 << pin) }

		public clear() { +{`port`}+ &= ~(1 << pin) }
		
		# THIS FUNCTION IS WRONG! SHOULD BE PIN inside +{}+ not PORT	
		public bool get() { return (+{`port`}+ & (1 << pin)) ? true : false }

		public toggle()	{ +{`port`}+ ^= (1 << pin) }

		public makeInput()	{ +{`ddr`}+ &= ~(1 << pin) }

		public bool isInput() { return (+{`ddr`}+ & (1 << pin)) ? false : true }

		public makeOutput()	{ +{`ddr`}+ |= (1 << pin) }

		public bool isOutput() { return (+{`ddr`}+ & (1 << pin)) ? true : false }
	}
