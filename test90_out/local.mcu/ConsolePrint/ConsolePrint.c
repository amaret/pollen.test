
/*
 * ======== string literals ========
 */

static const char local_mcu_ConsolePrint__s__fileName[] = "ConsolePrint.p";
static const char local_mcu_ConsolePrint__s__2[] = "\033[92m";
static const char local_mcu_ConsolePrint__s__4[] = "\033[91m";
static const char local_mcu_ConsolePrint__s__0[] = "\033[95m";
static const char local_mcu_ConsolePrint__s__1[] = "\033[94m";
static const char local_mcu_ConsolePrint__s__3[] = "\033[93m";
static const char local_mcu_ConsolePrint__s__5[] = "\033[0m";
static const char local_mcu_ConsolePrint__s__6[] = "ConsolePrint";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 

/*
 * ======== function definitions ========
 */

void local_mcu_ConsolePrint_printUint__E( uint32 u ) {
     printf("%iu", u) ;

}

void local_mcu_ConsolePrint_printInt__E( int32 i ) {
     printf("%i", i) ;

}

void local_mcu_ConsolePrint_printReal__E( float f ) {
     printf("%f", (float)f) ;

}

void local_mcu_ConsolePrint_printBool__E( bool b ) {
    if ((b)) {
         printf("true") ;

    }
    else {
         printf("false") ;

    }
}

void local_mcu_ConsolePrint_targetInit__I() {
}

void local_mcu_ConsolePrint_printStr__E( string s ) {
     printf("%s", s) ;

}

