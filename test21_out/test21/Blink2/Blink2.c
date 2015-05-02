
/*
 * ======== string literals ========
 */

static const char test21_Blink2__s__fileName[] = "Blink2.p";
static const char test21_Blink2__s__0[] = "Blink2";

/*
 * ======== function definitions ========
 */

void test21_Blink2_pollen__reset__E() {
    atmel_atmega328_PB5_clear__E();
}

void test21_Blink2_pollen__run__E() {
    while (true) {
        atmel_atmega328_PB5_set__E();
        test21_Blink2_delaySome__I();
        atmel_atmega328_PB5_clear__E();
        test21_Blink2_delaySome__I();
    }
}

void test21_Blink2_targetInit__I() {
}

void test21_Blink2_delaySome__I() {
    uint32 i;
    for (i = 0; (i) < 100000; (i)++) {
        atmel_atmega328_Mcu_cycle__E();
    }
}

