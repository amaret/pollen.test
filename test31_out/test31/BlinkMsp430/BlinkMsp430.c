
/*
 * ======== string literals ========
 */

static const char test31_BlinkMsp430__s__fileName[] = "BlinkMsp430.p";
static const char test31_BlinkMsp430__s__0[] = "BlinkMsp430";

/*
 * ======== function definitions ========
 */

void test31_BlinkMsp430_delay__I( uint16 ms ) {
    uint16 us;
    for (; (ms) > 0; --(ms)) {
        for (us = 1000; (us) > 0; --(us)) {
             asm ("nop") ;

        }
    }
}

void test31_BlinkMsp430_pollen__run__E() {
    while (true) {
        test31_BlinkMsp430_delay__I(200);
    }
}

void test31_BlinkMsp430_targetInit__I() {
}

