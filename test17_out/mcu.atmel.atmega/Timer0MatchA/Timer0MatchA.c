
/*
 * ======== string literals ========
 */

static const char mcu_atmel_atmega_Timer0MatchA__s__fileName[] = "Timer0MatchA.p";
static const char mcu_atmel_atmega_Timer0MatchA__s__1[] = "TIMER0_COMPA_vect";
static const char mcu_atmel_atmega_Timer0MatchA__s__3[] = "OCIE0A";
static const char mcu_atmel_atmega_Timer0MatchA__s__5[] = "OCF0A";
static const char mcu_atmel_atmega_Timer0MatchA__s__4[] = "TIFR0";
static const char mcu_atmel_atmega_Timer0MatchA__s__2[] = "TIMSK0";
static const char mcu_atmel_atmega_Timer0MatchA__s__0[] = "Timer0MatchA";

/*
 * ======== code injections ========
 */

 #include <avr/io.h> 
 #include <avr/interrupt.h> 
 ISR( 
TIMER0_COMPA_vect
 ) { 
isr()
;} 

/*
 * ======== function definitions ========
 */

void mcu_atmel_atmega_Timer0MatchA_setHandler__E( mcu_atmel_atmega_Timer0MatchA_Handler_handle h ) {
    mcu_atmel_atmega_Timer0MatchA_h__V = (h);
}

void mcu_atmel_atmega_Timer0MatchA_enable__E() {
    TIMSK0 |= (1 << OCIE0A);
}

void mcu_atmel_atmega_Timer0MatchA_disable__E() {
    TIMSK0 &= ~(1 << OCIE0A);
}

void mcu_atmel_atmega_Timer0MatchA_clear__E() {
    TIFR0 &= ~(1 << OCF0A);
}

void mcu_atmel_atmega_Timer0MatchA_isr__I() {
    if ((mcu_atmel_atmega_Timer0MatchA_h__V) != null) {
        mcu_atmel_atmega_Timer0MatchA_h__V();
    }
}

void mcu_atmel_atmega_Timer0MatchA_targetInit__I() {
}

bool mcu_atmel_atmega_Timer0MatchA_enabled__E() {
    return(  TIMSK0 & (1 << OCIE0A)  );
}

