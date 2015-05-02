
/*
 * ======== string literals ========
 */

static const char atmel_atmega8_Timer0MatchA__s__fileName[] = "Timer0MatchA.p";
static const char atmel_atmega8_Timer0MatchA__s__1[] = "TIMER0_COMPA_vect";
static const char atmel_atmega8_Timer0MatchA__s__3[] = "OCIE0A";
static const char atmel_atmega8_Timer0MatchA__s__5[] = "OCF0A";
static const char atmel_atmega8_Timer0MatchA__s__4[] = "TIFR0";
static const char atmel_atmega8_Timer0MatchA__s__2[] = "TIMSK0";
static const char atmel_atmega8_Timer0MatchA__s__0[] = "Timer0MatchA";

/*
 * ======== code injections ========
 */

 #include <avr/interrupt.h> 

    ISR( TIMER0_COMPA_vect ) {
      (atmel_atmega8_Timer0MatchA_handler__V)();
    }
   

/*
 * ======== function definitions ========
 */

void atmel_atmega8_Timer0MatchA_enable__E() {
    TIMSK0 |= (1 << OCIE0A);
}

void atmel_atmega8_Timer0MatchA_disable__E() {
    TIMSK0 &= ~(1 << OCIE0A);
}

bool atmel_atmega8_Timer0MatchA_isEnabled__E() {
    return(  TIMSK0 & (1 << OCIE0A)  );
}

void atmel_atmega8_Timer0MatchA_clear__E() {
    TIFR0 &= ~(1 << OCF0A);
}

void atmel_atmega8_Timer0MatchA_targetInit__I() {
}

