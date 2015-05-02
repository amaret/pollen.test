
/*
 * ======== string literals ========
 */

static const char test61_AvrPin__s__fileName[] = "AvrPin.p";
static const char test61_AvrPin__s__1[] = "AvrPin";
static const char test61_AvrPin__s__0[] = "In AvrPin.toggle()\n";

/*
 * ======== function definitions ========
 */

void test61_AvrPin_set__E() {
    (test61_AvrPin_PORTB__V) |= (1 << 5);
}

void test61_AvrPin_makeOutput__E() {
    (test61_AvrPin_DDRB__V) |= (1 << 5);
}

bool test61_AvrPin_isInput__E() {
    return(  ((test61_AvrPin_DDRB__V) & (1 << 5)) ? false : true  );
}

bool test61_AvrPin_isOutput__E() {
    return(  ((test61_AvrPin_DDRB__V) & (1 << 5)) ? true : false  );
}

bool test61_AvrPin_get__E() {
    return(  ((test61_AvrPin_PORTB__V) & (1 << 5)) ? true : false  );
}

void test61_AvrPin_clear__E() {
    (test61_AvrPin_PORTB__V) &= ~(1 << 5);
}

void test61_AvrPin_toggle__E() {
    test61_Blink_pollen__printStr((string)test61_AvrPin__s__0);
    (test61_AvrPin_PORTB__V) ^= (1 << 5);
}

void test61_AvrPin_makeInput__E() {
    (test61_AvrPin_DDRB__V) &= ~(1 << 5);
}

void test61_AvrPin_targetInit__I() {
}

