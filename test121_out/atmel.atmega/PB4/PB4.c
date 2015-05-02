
/*
 * ======== string literals ========
 */

static const char atmel_atmega_PB4__s__fileName[] = "PB4.p";
static const char atmel_atmega_PB4__s__1[] = "B";
static const char atmel_atmega_PB4__s__0[] = "PB4";

/*
 * ======== code injections ========
 */

 #include <avr/io.h> 

/*
 * ======== function definitions ========
 */

void atmel_atmega_PB4_set__E() {
     PORTB |= atmel_atmega_PB4_pinMask__V ;

}

void atmel_atmega_PB4_makeOutput__E() {
     DDRB |= atmel_atmega_PB4_pinMask__V ;

}

bool atmel_atmega_PB4_isInput__E() {
    return(   DDRB & atmel_atmega_PB4_pinMask__V  ? false : true  );
}

bool atmel_atmega_PB4_isOutput__E() {
    return(   DDRB & atmel_atmega_PB4_pinMask__V  ? true : false  );
}

bool atmel_atmega_PB4_get__E() {
    return(   (PORTB & atmel_atmega_PB4_pinMask__V)  ? true : false  );
}

void atmel_atmega_PB4_clear__E() {
     PORTB &= ~atmel_atmega_PB4_pinMask__V ;

}

void atmel_atmega_PB4_toggle__E() {
     PORTB ^= atmel_atmega_PB4_pinMask__V ;

}

void atmel_atmega_PB4_makeInput__E() {
     DDRB &= ~atmel_atmega_PB4_pinMask__V ;

}

void atmel_atmega_PB4_targetInit__I() {
}

