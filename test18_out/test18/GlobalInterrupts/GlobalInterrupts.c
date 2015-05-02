
/*
 * ======== string literals ========
 */

static const char test18_GlobalInterrupts__s__fileName[] = "GlobalInterrupts.p";
static const char test18_GlobalInterrupts__s__0[] = "GlobalInterrupts";

/*
 * ======== code injections ========
 */

 #include <avr/io.h>
       #include <avr/interrupt.h> 

/*
 * ======== function definitions ========
 */

void test18_GlobalInterrupts_restore__E( uint16 key ) {
    if ((key) != 0) {
        sei();

    }
    else {
        cli();

    }
}

uint16 test18_GlobalInterrupts_disable__E() {
    uint16 key;
    key = SREG & (1 << 7);
    cli();

    return(  (key)  );
}

void test18_GlobalInterrupts_enable__E() {
    sei();

}

void test18_GlobalInterrupts_targetInit__I() {
}

