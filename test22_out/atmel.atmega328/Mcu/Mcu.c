
/*
 * ======== string literals ========
 */

static const char atmel_atmega328_Mcu__s__fileName[] = "Mcu.p";
static const char atmel_atmega328_Mcu__s__0[] = "Mcu";

/*
 * ======== function definitions ========
 */

void atmel_atmega328_Mcu_wait__E( uint32 us ) {
    for (; (us) > 0; --(us)) {
         asm ("nop") ;

         asm ("nop") ;

         asm ("nop") ;

         asm ("nop") ;

         asm ("nop") ;

         asm ("nop") ;

         asm ("nop") ;

         asm ("nop") ;

         asm ("nop") ;

         asm ("nop") ;

    }
}

uint32 atmel_atmega328_Mcu_getFrequency__E() {
    return(  atmel_atmega328_Mcu_sysFreq__V  );
}

void atmel_atmega328_Mcu_reset__E() {
}

void atmel_atmega328_Mcu_cycle__E() {
     asm ("nop") ;

}

void atmel_atmega328_Mcu_targetInit__I() {
}

void atmel_atmega328_Mcu_shutdown__E() {
}

void atmel_atmega328_Mcu_setFrequency__E( uint32 hz ) {
    atmel_atmega328_Mcu_sysFreq__V = (hz);
}

