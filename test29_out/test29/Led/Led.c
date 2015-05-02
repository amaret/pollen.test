
/*
 * ======== string literals ========
 */

static const char test29_Led__s__fileName[] = "Led.p";
static const char test29_Led__s__0[] = "Led";

/*
 * ======== function definitions ========
 */

void test29_Led_toggle__E() {
    test29_AvrPin_toggle__E();
}

void test29_Led_targetInit__I() {
    test29_AvrPin_clear__E();
    test29_AvrPin_makeOutput__E();
}

void test29_Led_off__E() {
    test29_AvrPin_clear__E();
}

void test29_Led_on__E() {
    test29_AvrPin_set__E();
}

