
/*
 * ======== string literals ========
 */

static const char test44_BlinkEnvPin__s__fileName[] = "BlinkEnvPin.p";
static const char test44_BlinkEnvPin__s__0[] = "BlinkEnvPin";

/*
 * ======== function definitions ========
 */

void test44_BlinkEnvPin_pollen__reset__E() {
    atmel_atmega8_PB5_clear__E();
}

void test44_BlinkEnvPin_pollen__run__E() {
    uint16 i;
    
    while (true) {
        atmel_atmega8_PB5_toggle__E();
        for ((i) = 0; (i) < 250; (i)++) {
            atmel_atmega8_Core_wait__E(1000);
        }
    }
}

void test44_BlinkEnvPin_targetInit__I() {
}

