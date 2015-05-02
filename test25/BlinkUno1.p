----
Toggle an Arduino Uno pin periodically, blinking an LED
----
# TEST Composition implements a protocol
# TEST more than one impl for intrinsic pollen.reset - an error

from cc.arduino import Uno
from Uno import Mcu
#from DigitalPin import D13

module BlinkUno1 {

    pollen.reset() {
        Uno.D13.clear()
        #D13.clear()
        Uno.D13.makeOutput()
        #D13.makeOutput()
    }

    pollen.run() {

        while (true) {
            Uno.D13.toggle()
            #D13.toggle()
            for(int16 i = 0; i < 50; i++) {
                //Uno.wait(10000)
                Mcu.wait(10000)
            }
        }
    }

}
