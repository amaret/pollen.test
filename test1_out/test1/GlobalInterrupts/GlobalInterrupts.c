
/*
 * ======== string literals ========
 */

static const char test1_GlobalInterrupts__s__fileName[] = "GlobalInterrupts.p";
static const char test1_GlobalInterrupts__s__0[] = "GlobalInterrupts";

/*
 * ======== code injections ========
 */


#include <avr/io.h>
#include <avr/interrupt.h> 

/*
 * ======== function definitions ========
 */

uint16 test1_GlobalInterrupts_disable__E() {
    uint16 key;
    key = SREG & (1 << 7);
    cli();

    return(  (key)  );
}

void test1_GlobalInterrupts_enable__E() {
    sei();

}

void test1_GlobalInterrupts_markUsed__E() {
}

void test1_GlobalInterrupts_targetInit__I() {
}

