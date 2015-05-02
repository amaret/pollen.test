
/*
 * ======== string literals ========
 */

static const char test29_Blink4__s__fileName[] = "Blink4.p";
static const char test29_Blink4__s__0[] = "Blink4";

/*
 * ======== function definitions ========
 */

void test29_Blink4_delay__I( uint16 ms ) {
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

void test29_Blink4_pollen__run__E() {
    while (true) {
        test29_Led_toggle__E();
        test29_Blink4_delay__I(500);
    }
}

void test29_Blink4_targetInit__I() {
}

