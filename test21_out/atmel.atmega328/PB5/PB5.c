
/*
 * ======== string literals ========
 */

static const char atmel_atmega328_PB5__s__fileName[] = "PB5.p";
static const char atmel_atmega328_PB5__s__0[] = "PB5";

/*
 * ======== code injections ========
 */

 #include <avr/io.h> 

/*
 * ======== function definitions ========
 */

void atmel_atmega328_PB5_set__E() {
    PORTB |= (1 << 5);
}

void atmel_atmega328_PB5_makeOutput__E() {
    DDRB |= (1 << 5);
}

bool atmel_atmega328_PB5_isInput__E() {
    return(  (DDRB & (1 << 5)) ? false : true  );
}

bool atmel_atmega328_PB5_isOutput__E() {
    return(  (DDRB & (1 << 5)) ? true : false  );
}

bool atmel_atmega328_PB5_get__E() {
    return(  (PORTB & (1 << 5)) ? true : false  );
}

void atmel_atmega328_PB5_clear__E() {
    PORTB &= ~(1 << 5);
}

void atmel_atmega328_PB5_toggle__E() {
    PORTB ^= (1 << 5);
}

void atmel_atmega328_PB5_makeInput__E() {
    DDRB &= ~(1 << 5);
}

void atmel_atmega328_PB5_targetInit__I() {
}

