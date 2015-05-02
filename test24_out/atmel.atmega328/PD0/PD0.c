
/*
 * ======== string literals ========
 */

static const char atmel_atmega328_PD0__s__fileName[] = "PD0.p";
static const char atmel_atmega328_PD0__s__2[] = "DDR0";
static const char atmel_atmega328_PD0__s__1[] = "PORTD";
static const char atmel_atmega328_PD0__s__0[] = "PD0";

/*
 * ======== code injections ========
 */

 #include <avr/io.h> 

/*
 * ======== function definitions ========
 */

void atmel_atmega328_PD0_set__E() {
    PORTD |= (1 << (atmel_atmega328_PD0_bit));
}

void atmel_atmega328_PD0_makeOutput__E() {
    DDR0 &= ~(1 << (atmel_atmega328_PD0_bit));
}

bool atmel_atmega328_PD0_isInput__E() {
    return(  (DDR0 & (1 << (atmel_atmega328_PD0_bit))) ? false : true  );
}

bool atmel_atmega328_PD0_isOutput__E() {
    return(  (DDR0 & (1 << (atmel_atmega328_PD0_bit))) ? true : false  );
}

bool atmel_atmega328_PD0_get__E() {
    return(  (PORTD & (1 << (atmel_atmega328_PD0_bit))) ? true : false  );
}

void atmel_atmega328_PD0_clear__E() {
    PORTD &= (1 << (atmel_atmega328_PD0_bit));
}

void atmel_atmega328_PD0_toggle__E() {
    PORTD ^= (1 << (atmel_atmega328_PD0_bit));
}

void atmel_atmega328_PD0_makeInput__E() {
    DDR0 &= ~(1 << (atmel_atmega328_PD0_bit));
}

void atmel_atmega328_PD0_targetInit__I() {
}

