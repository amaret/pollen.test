
/*
 * ======== string literals ========
 */

static const char test24_Blink5__s__fileName[] = "Blink5.p";
static const char test24_Blink5__s__1[] = "DDR0";
static const char test24_Blink5__s__0[] = "PORTD";
static const char test24_Blink5__s__2[] = "Blink5";

/*
 * ======== function definitions ========
 */

void test24_Blink5_pollen__reset__E() {
    atmel_atmega328_PD0_clear__E();
    atmel_atmega328_PD0_makeOutput__E();
}

void test24_Blink5_pollen__run__E() {
    while (true) {
        atmel_atmega328_PD0_toggle__E();
        test24_Blink5_delaySome__I();
    }
}

void test24_Blink5_targetInit__I() {
}

void test24_Blink5_delaySome__I() {
    uint32 i;
    for ((i) = 0; (i) < 10000; (i)++) {
        atmel_atmega328_Mcu_cycle__E();
    }
}

