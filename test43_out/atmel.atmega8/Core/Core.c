
/*
 * ======== string literals ========
 */

static const char atmel_atmega8_Core__s__fileName[] = "Core.p";
static const char atmel_atmega8_Core__s__0[] = "Core";

/*
 * ======== code injections ========
 */

 #include <avr/io.h> 

/*
 * ======== function definitions ========
 */

void atmel_atmega8_Core_wait__E( uint16 us ) {
    uint8 i;
    
    for (; (us) > 0; --(us)) {
        for ((i) = 0; (i) < (atmel_atmega8_Core_nops__V); (i)++) {
             asm("nop") ;

        }
    }
}

uint32 atmel_atmega8_Core_getFrequency__E() {
    return(  (atmel_atmega8_Core_sysFreq__V)  );
}

void atmel_atmega8_Core_reset__E() {
}

void atmel_atmega8_Core_cycle__E() {
     asm("nop") ;

}

void atmel_atmega8_Core_targetInit__I() {
}

void atmel_atmega8_Core_shutdown__E() {
}

void atmel_atmega8_Core_setFrequency__E( uint32 hz ) {
    (atmel_atmega8_Core_sysFreq__V) = (hz);
}

