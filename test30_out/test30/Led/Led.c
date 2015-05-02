
/*
 * ======== string literals ========
 */

static const char test30_Led__s__fileName[] = "Led.p";
static const char test30_Led__s__0[] = "Led";

/*
 * ======== function definitions ========
 */

void test30_Led_toggle__E() {
    test30_AvrPin_toggle__E();
}

void test30_Led_targetInit__I() {
    test30_AvrPin_clear__E();
    test30_AvrPin_makeOutput__E();
}

void test30_Led_off__E() {
    test30_AvrPin_clear__E();
}

void test30_Led_on__E() {
    test30_AvrPin_set__E();
}

