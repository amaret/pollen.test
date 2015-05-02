
/*
 * ======== string literals ========
 */

static const char test36_Blink3__s__fileName[] = "Blink3.p";
static const char test36_Blink3__s__0[] = "Blink3";

/*
 * ======== function definitions ========
 */

void test36_Blink3_pollen__reset__E() {
    amaret_local_Mcu_reset__E();
    pollen_hardware_Led_off__E();
}

void test36_Blink3_pollen__run__E() {
    uint8 x;
    uint16 i;
    for (x = 0; (x) < 20; (x)++) {
        pollen_hardware_Led_toggle__E();
        for (i = 0; (i) < 1000; (i)++) {
            amaret_local_Mcu_wait__E(1000);
        }
    }
}

void test36_Blink3_pollen__shutdown__E( uint8 id ) {
    amaret_local_Mcu_shutdown__E();
}

void test36_Blink3_targetInit__I() {
}

