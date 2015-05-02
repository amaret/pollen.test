
/*
 * ======== string literals ========
 */

static const char test26_BlinkAvr__s__fileName[] = "BlinkAvr.p";
static const char test26_BlinkAvr__s__0[] = "BlinkAvr";

/*
 * ======== code injections ========
 */

 #include <avr/io.h> 

/*
 * ======== function definitions ========
 */

void test26_BlinkAvr_delay__I( uint16 ms ) {
    uint16 us;
    for (; (ms) > 0; --(ms)) {
        for (us = 1000; (us) > 0; --(us)) {
             asm ("nop") ;

        }
    }
}

void test26_BlinkAvr_pollen__run__E() {
    PORTB &= ~(1 << 5);
    DDRB |= (1 << 5);
    while (true) {
        PORTB ^= (1 << 5);
        test26_BlinkAvr_delay__I(1000);
    }
}

void test26_BlinkAvr_targetInit__I() {
}

