
/*
 * ======== string literals ========
 */

static const char test20_Blink1__s__fileName[] = "Blink1.p";
static const char test20_Blink1__s__0[] = "Blink1";

/*
 * ======== function definitions ========
 */

void test20_Blink1_pollen__reset__E() {
    atmel_atmega328_PD0_clear__E();
}

void test20_Blink1_pollen__run__E() {
    while (true) {
        atmel_atmega328_PD0_set__E();
        test20_Blink1_delaySome__I();
        atmel_atmega328_PD0_clear__E();
        test20_Blink1_delaySome__I();
    }
}

void test20_Blink1_targetInit__I() {
}

void test20_Blink1_delaySome__I() {
    uint32 i;
    for ((i) = 0; (i) < 10000; (i)++) {
         asm("nop") ;

    }
}

