
/*
 * ======== string literals ========
 */

static const char test35_Timer0MatchA__s__fileName[] = "Timer0MatchA.p";
static const char test35_Timer0MatchA__s__1[] = "TIMER0_COMPA_vect";
static const char test35_Timer0MatchA__s__3[] = "OCIE0A";
static const char test35_Timer0MatchA__s__5[] = "OCF0A";
static const char test35_Timer0MatchA__s__4[] = "TIFR0";
static const char test35_Timer0MatchA__s__2[] = "TIMSK0";
static const char test35_Timer0MatchA__s__0[] = "Timer0MatchA";

/*
 * ======== code injections ========
 */

  
      ISR( TIMER0_COMPA_vect ) { 
         (test35_Timer0MatchA_handler__V)();
      }   
  

/*
 * ======== function definitions ========
 */

void test35_Timer0MatchA_enable__E() {
    TIMSK0 |= (1 << OCIE0A);
}

void test35_Timer0MatchA_disable__E() {
    TIMSK0 &= ~(1 << OCIE0A);
}

bool test35_Timer0MatchA_isEnabled__E() {
    return(  TIMSK0 & (1 << OCIE0A)  );
}

void test35_Timer0MatchA_clear__E() {
    TIFR0 &= ~(1 << OCF0A);
}

void test35_Timer0MatchA_targetInit__I() {
}

