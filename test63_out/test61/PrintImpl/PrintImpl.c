
/*
 * ======== string literals ========
 */

static const char test61_PrintImpl__s__fileName[] = "PrintImpl.p";
static const char test61_PrintImpl__s__0[] = "PrintImpl";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 

/*
 * ======== function definitions ========
 */

void test61_PrintImpl_printUint__E( uint32 u ) {
     printf("%u", (unsigned int)u) ;

}

void test61_PrintImpl_printInt__E( int32 i ) {
     printf("%i", (int)i) ;

}

void test61_PrintImpl_printReal__E( float f ) {
     printf("%f", (float)f) ;

}

void test61_PrintImpl_printBool__E( bool b ) {
    if ((b)) {
         printf("%s", "true") ;

    }
    else {
         printf("%s", "false") ;

    }
}

void test61_PrintImpl_targetInit__I() {
}

void test61_PrintImpl_printStr__E( string s ) {
     printf("%s", s) ;

}

