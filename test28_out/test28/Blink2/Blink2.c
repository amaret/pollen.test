
/*
 * ======== string literals ========
 */

static const char test28_Blink2__s__fileName[] = "Blink2.p";
static const char test28_Blink2__s__0[] = "Blink2";

/*
 * ======== function definitions ========
 */

void test28_Blink2_delay__I( uint16 ms ) {
    uint16 us;
    uint8 i;
    for (; (ms) > 0; --(ms)) {
        for (us = 1000; (us) > 0; --(us)) {
            for (i = 0; (i) < 5; (i)++) {
                 asm ("nop") ;

            }
        }
    }
}

void test28_Blink2_pollen__run__E() {
    while (true) {
        test28_MspPin_toggle__E();
        test28_Blink2_delay__I(500);
    }
}

void test28_Blink2_targetInit__I() {
    WDTCTL = WDTPW | WDTHOLD;
    test28_MspPin_clear__E();
    test28_MspPin_makeOutput__E();
}

