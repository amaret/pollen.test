
/*
 * ======== string literals ========
 */

static const char test4_Core__s__fileName[] = "Core.p";
static const char test4_Core__s__0[] = "Core";

/*
 * ======== code injections ========
 */

 #include <avr/io.h> 

/*
 * ======== function definitions ========
 */

void test4_Core_wait__E( uint16 us ) {
    uint8 i;
    
    for (; (us) > 0; --(us)) {
        for ((i) = 0; (i) < (test4_Core_nops__V); (i)++) {
             asm("nop") ;

        }
    }
}

uint32 test4_Core_getFrequency__E() {
    return(  (test4_Core_sysFreq__V)  );
}

void test4_Core_reset__E() {
}

void test4_Core_cycle__E() {
     asm("nop") ;

}

void test4_Core_targetInit__I() {
}

void test4_Core_shutdown__E() {
}

void test4_Core_setFrequency__E( uint32 hz ) {
    (test4_Core_sysFreq__V) = (hz);
}

