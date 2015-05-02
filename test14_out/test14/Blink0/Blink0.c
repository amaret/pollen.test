
/*
 * ======== string literals ========
 */

static const char test14_Blink0__s__fileName[] = "Blink0.p";
static const char test14_Blink0__s__0[] = "Blink0";

/*
 * ======== code injections ========
 */

 #include <avr/io.h> 

/*
 * ======== function definitions ========
 */

void test14_Blink0_setPin__I() {
    PORTD |= (1 << 0);
}

void test14_Blink0_clearPin__I() {
    PORTD &= (1 << 0);
}

void test14_Blink0_pollen__run__E() {
    DDR0 &= ~(1 << 0);
    while (true) {
        test14_Blink0_setPin__I();
        test14_Blink0_delaySome__I();
        test14_Blink0_clearPin__I();
        test14_Blink0_delaySome__I();
    }
}

void test14_Blink0_targetInit__I() {
}

void test14_Blink0_delaySome__I() {
    uint16 i;
    for (i = 0; (i) < 10000; (i)++) {
         asm("nop") ;

    }
}

