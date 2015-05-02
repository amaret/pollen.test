
/*
 * ======== string literals ========
 */

static const char test61_Led__s__fileName[] = "Led.p";
static const char test61_Led__s__0[] = "Led";

/*
 * ======== function definitions ========
 */

void test61_Led_toggle__E() {
    test61_AvrPin_toggle__E();
}

void test61_Led_targetInit__I() {
    test61_AvrPin_clear__E();
    test61_AvrPin_makeOutput__E();
}

void test61_Led_off__E() {
    test61_AvrPin_clear__E();
}

void test61_Led_on__E() {
    test61_AvrPin_set__E();
}

