
/*
 * ======== string literals ========
 */

static const char test22_Blink3__s__fileName[] = "Blink3.p";
static const char test22_Blink3__s__0[] = "Blink3";

/*
 * ======== function definitions ========
 */

void test22_Blink3_pollen__reset__E() {
    atmel_atmega328_PD0_clear__E();
}

void test22_Blink3_pollen__run__E() {
    while (true) {
        atmel_atmega328_PD0_set__E();
        test22_Blink3_delaySome__I();
        atmel_atmega328_PD0_clear__E();
        test22_Blink3_delaySome__I();
    }
}

void test22_Blink3_targetInit__I() {
}

void test22_Blink3_delaySome__I() {
    uint32 i;
    for ((i) = 0; (i) < 10000; (i)++) {
        atmel_atmega328_Mcu_cycle__E();
    }
}

