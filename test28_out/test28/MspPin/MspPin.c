
/*
 * ======== string literals ========
 */

static const char test28_MspPin__s__fileName[] = "MspPin.p";
static const char test28_MspPin__s__0[] = "MspPin";

/*
 * ======== code injections ========
 */

 #include <msp430g2452.h> 

/*
 * ======== function definitions ========
 */

void test28_MspPin_set__E() {
    P1OUT |= (1 << 0);
}

void test28_MspPin_makeOutput__E() {
    P1DIR |= (1 << 0);
}

bool test28_MspPin_isInput__E() {
    return(  (P1DIR & (1 << 0)) ? false : true  );
}

bool test28_MspPin_isOutput__E() {
    return(  (P1DIR & (1 << 0)) ? true : false  );
}

bool test28_MspPin_get__E() {
    return(  (P1IN & (1 << 0)) ? true : false  );
}

void test28_MspPin_clear__E() {
    P1OUT &= ~(1 << 0);
}

void test28_MspPin_toggle__E() {
    P1OUT ^= (1 << 0);
}

void test28_MspPin_makeInput__E() {
    P1DIR &= ~(1 << 0);
}

void test28_MspPin_targetInit__I() {
}

