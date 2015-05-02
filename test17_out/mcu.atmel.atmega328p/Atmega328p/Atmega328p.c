
/*
 * ======== string literals ========
 */

static const char mcu_atmel_atmega328p_Atmega328p__s__fileName[] = "Atmega328p.p";
static const char mcu_atmel_atmega328p_Atmega328p__s__0[] = "Atmega328p";

/*
 * ======== function definitions ========
 */

uint32 mcu_atmel_atmega328p_Atmega328p_getSystemFrequency__E() {
    return(  mcu_atmel_atmega328p_Atmega328p_sysFreq__V  );
}

void mcu_atmel_atmega328p_Atmega328p_wait__E( uint32 us ) {
    for (; (us) > 0; (us)--) {
         asm("nop") ;

         asm("nop") ;

         asm("nop") ;

         asm("nop") ;

         asm("nop") ;

         asm("nop") ;

         asm("nop") ;

         asm("nop") ;

         asm("nop") ;

         asm("nop") ;

         asm("nop") ;

    }
}

void mcu_atmel_atmega328p_Atmega328p_setSystemFrequency__E( uint32 hz ) {
    mcu_atmel_atmega328p_Atmega328p_sysFreq__V = (hz);
}

void mcu_atmel_atmega328p_Atmega328p_reset__E() {
}

void mcu_atmel_atmega328p_Atmega328p_targetInit__I() {
}

void mcu_atmel_atmega328p_Atmega328p_shutdown__E() {
}

void mcu_atmel_atmega328p_Atmega328p_nop__E() {
     asm("nop") ;

}

