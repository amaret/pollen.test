
/*
 * ======== string literals ========
 */

static const char test29_AvrPin__s__fileName[] = "AvrPin.p";
static const char test29_AvrPin__s__0[] = "AvrPin";

/*
 * ======== code injections ========
 */

 #include <avr/io.h> 

/*
 * ======== function definitions ========
 */

void test29_AvrPin_set__E() {
    PORTB |= (1 << 5);
}

void test29_AvrPin_makeOutput__E() {
    DDRB |= (1 << 5);
}

bool test29_AvrPin_isInput__E() {
    return(  (DDRB & (1 << 5)) ? false : true  );
}

bool test29_AvrPin_isOutput__E() {
    return(  (DDRB & (1 << 5)) ? true : false  );
}

bool test29_AvrPin_get__E() {
    return(  (PORTB & (1 << 5)) ? true : false  );
}

void test29_AvrPin_clear__E() {
    PORTB &= ~(1 << 5);
}

void test29_AvrPin_toggle__E() {
    PORTB ^= (1 << 5);
}

void test29_AvrPin_makeInput__E() {
    DDRB &= ~(1 << 5);
}

void test29_AvrPin_targetInit__I() {
}

