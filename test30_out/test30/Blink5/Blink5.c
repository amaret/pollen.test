
/*
 * ======== string literals ========
 */

static const char test30_Blink5__s__fileName[] = "Blink5.p";
static const char test30_Blink5__s__0[] = "Blink5";

/*
 * ======== function definitions ========
 */

void test30_Blink5_delay__I( uint16 ms ) {
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

void test30_Blink5_pollen__run__E() {
    while (true) {
        test30_Led_toggle__E();
        test30_Blink5_delay__I(500);
    }
}

void test30_Blink5_targetInit__I() {
    test30_Led_off__E();
}

