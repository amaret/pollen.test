
/*
 * ======== string literals ========
 */

static const char test25_BlinkUno1__s__fileName[] = "BlinkUno1.p";
static const char test25_BlinkUno1__s__0[] = "BlinkUno1";

/*
 * ======== function definitions ========
 */

void test25_BlinkUno1_pollen__reset__E() {
    atmel_atmega328_PB5_clear__E();
    atmel_atmega328_PB5_makeOutput__E();
}

void test25_BlinkUno1_pollen__run__E() {
    int16 i;
    while (true) {
        atmel_atmega328_PB5_toggle__E();
        for (i = 0; (i) < 50; (i)++) {
            atmel_atmega328_Mcu_wait__E(10000);
        }
    }
}

void test25_BlinkUno1_targetInit__I() {
}

