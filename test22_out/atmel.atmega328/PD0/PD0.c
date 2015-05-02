
/*
 * ======== string literals ========
 */

static const char atmel_atmega328_PD0__s__fileName[] = "PD0.p";
static const char atmel_atmega328_PD0__s__0[] = "PD0";

/*
 * ======== code injections ========
 */

 #include <avr/io.h> 

/*
 * ======== function definitions ========
 */

void atmel_atmega328_PD0_set__E() {
    PORTD |= (1 << 0);
}

void atmel_atmega328_PD0_makeOutput__E() {
    DDRD &= ~(1 << 0);
}

bool atmel_atmega328_PD0_isInput__E() {
    return(  (DDRD & (1 << 0)) ? false : true  );
}

bool atmel_atmega328_PD0_isOutput__E() {
    return(  (DDRD & (1 << 0)) ? true : false  );
}

bool atmel_atmega328_PD0_get__E() {
    return(  (PORTD & (1 << 0)) ? true : false  );
}

void atmel_atmega328_PD0_clear__E() {
    PORTD &= (1 << 0);
}

void atmel_atmega328_PD0_toggle__E() {
    PORTD ^= (1 << 0);
}

void atmel_atmega328_PD0_makeInput__E() {
    DDRD &= ~(1 << 0);
}

void atmel_atmega328_PD0_targetInit__I() {
}

