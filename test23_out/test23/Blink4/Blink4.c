
/*
 * ======== string literals ========
 */

static const char test23_Blink4__s__fileName[] = "Blink4.p";
static const char test23_Blink4__s__1[] = "DDR0";
static const char test23_Blink4__s__2[] = "Blink4";
static const char test23_Blink4__s__0[] = "PORTD";

/*
 * ======== function definitions ========
 */

void test23_Blink4_pollen__reset__E() {
    atmel_atmega328_PD0_clear__E();
    atmel_atmega328_PD0_makeOutput__E();
}

void test23_Blink4_pollen__run__E() {
    while (true) {
        atmel_atmega328_PD0_toggle__E();
        test23_Blink4_delaySome__I();
    }
}

void test23_Blink4_targetInit__I() {
}

void test23_Blink4_delaySome__I() {
    uint32 i;
    for ((i) = 0; (i) < 10000; (i)++) {
        atmel_atmega328_Mcu_cycle__E();
    }
}

