
/*
 * ======== string literals ========
 */

static const char test43_BlinkEnvLed__s__fileName[] = "BlinkEnvLed.p";
static const char test43_BlinkEnvLed__s__0[] = "BlinkEnvLed";

/*
 * ======== function definitions ========
 */

void test43_BlinkEnvLed_pollen__reset__E() {
}

void test43_BlinkEnvLed_pollen__run__E() {
    uint16 i;
    
    while (true) {
        pollen_hardware_Led_toggle__E();
        for ((i) = 0; (i) < 50; (i)++) {
            atmel_atmega8_Core_wait__E(1000);
            atmel_atmega8_Core_wait__E(1000);
            atmel_atmega8_Core_wait__E(1000);
            wait /* ?? missing symbol ?? */ (1000);
        }
    }
}

void test43_BlinkEnvLed_targetInit__I() {
}

