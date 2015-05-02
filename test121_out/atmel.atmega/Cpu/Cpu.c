
/*
 * ======== string literals ========
 */

static const char atmel_atmega_Cpu__s__fileName[] = "Cpu.p";
static const char atmel_atmega_Cpu__s__1[] = " Cpu.ticksPerUs is: ";
static const char atmel_atmega_Cpu__s__3[] = "Cpu";
static const char atmel_atmega_Cpu__s__0[] = "SysFreq = ";
static const char atmel_atmega_Cpu__s__2[] = "\n";

/*
 * ======== code injections ========
 */

 #include <avr/io.h> 

/*
 * ======== function definitions ========
 */

void atmel_atmega_Cpu_wait__E( uint16 us ) {
    uint32 i;
    i = ((atmel_atmega_Cpu_ticksPerUs__V) * (us)) - 10;
    for (; (i) > 0; --(i)) {
         __asm__ __volatile__ ("nop") ;

    }
}

uint32 atmel_atmega_Cpu_getFrequency__E() {
    return(  (atmel_atmega_Cpu_sysFreq__V)  );
}

void atmel_atmega_Cpu_reset__E() {
}

void atmel_atmega_Cpu_cycle__E() {
     __asm__ __volatile__ ("nop") ;

}

void atmel_atmega_Cpu_targetInit__I() {
}

void atmel_atmega_Cpu_shutdown__E() {
}

void atmel_atmega_Cpu_setFrequency__E( uint32 hz ) {
    (atmel_atmega_Cpu_sysFreq__V) = (hz);
}

