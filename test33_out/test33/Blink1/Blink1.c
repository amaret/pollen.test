
/*
 * ======== string literals ========
 */

static const char test33_Blink1__s__fileName[] = "Blink1.p";
static const char test33_Blink1__s__1[] = "Blink1";
static const char test33_Blink1__s__0[] = "A";

/*
 * ======== function definitions ========
 */

void test33_Blink1_pollen__reset__E() {
    amaret_local_Mcu_reset__E();
    amaret_local_A1_clear__E();
    amaret_local_A1_makeOutput__E();
}

void test33_Blink1_pollen__run__E() {
    uint8 x;
    uint16 i;
    for (x = 0; (x) < 20; (x)++) {
        amaret_local_A1_toggle__E();
        for (i = 0; (i) < 1000; (i)++) {
            amaret_local_Mcu_wait__E(1000);
        }
    }
}

void test33_Blink1_pollen__shutdown__E( uint8 id ) {
    amaret_local_Mcu_shutdown__E();
}

void test33_Blink1_targetInit__I() {
}

