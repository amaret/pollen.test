from pollen.interfaces import GlobalInterrupts as GI
import ComposPreset

module GlobalInterrupts implements GI {

    +{
#include <avr/io.h>
#include <avr/interrupt.h> }+

        host uint8 hostVar = 4
        uint8 giVar = 0

        host GlobalInterupts() {
            hostVar = 3
        }

        public uint16 disable() {
            uint16 key = +{SREG}+ & (1 << 7)
            +{cli()}+
            return key
        }

        public enable() {
            +{sei()}+
        }
        public host uint8 getHostVar() {
            return hostVar
        }
        public host setHostVar(uint8 n) {
            //print "print at host time"
            hostVar = n
        }
        public markUsed() {}

        !--
        public restore(bool f) {
            // ERROR in implements, key must be bool
            //uint16 key = 1
            if (key != 0) {
                +{sei()}+
            }
            else {
                +{cli()}+
            }
        }
        --!
    }
