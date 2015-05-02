
/*
 * ======== string literals ========
 */

static const char test27_Blink3__s__fileName[] = "Blink3.p";
static const char test27_Blink3__s__0[] = "Blink3";

/*
 * ======== function definitions ========
 */

void test27_Blink3_delay__I( uint16 ms ) {
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

void test27_Blink3_pollen__run__E() {
    while (true) {
        test27_AvrPin_toggle__E();
        test27_Blink3_delay__I(1500);
    }
}

void test27_Blink3_targetInit__I() {
    test27_AvrPin_clear__E();
    test27_AvrPin_makeOutput__E();
}

