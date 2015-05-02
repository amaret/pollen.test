
/*
 * ======== string literals ========
 */

static const char test5_BlinkMilli__s__fileName[] = "BlinkMilli.p";
static const char test5_BlinkMilli__s__0[] = "BlinkMilli";

/*
 * ======== function definitions ========
 */

void test5_BlinkMilli_pollen__reset__E() {
    mcu_atmel_atmega328p_Atmega328p_reset__E();
}

void test5_BlinkMilli_pollen__run__E() {
    pollen_time_TimerMilli_start__E((test5_BlinkMilli_toggle__I), 50, true);
    while (true) {
    }
}

void test5_BlinkMilli_madams_chkArray__I() {
    uint8 arr[8];
    uint8 arr2d[8][2];
    
    
}

void test5_BlinkMilli_toggle__I() {
    pollen_parts_Led_toggle__E();
}

void test5_BlinkMilli_targetInit__I() {
}

