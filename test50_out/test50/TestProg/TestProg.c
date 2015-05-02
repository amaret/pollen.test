
/*
 * ======== string literals ========
 */

static const char test50_TestProg__s__fileName[] = "TestProg.p";
static const char test50_TestProg__s__2[] = "TestProg";
static const char test50_TestProg__s__0[] = "led";
static const char test50_TestProg__s__1[] = "hll";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 
 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test50_TestProg_led_print_led__I( test50_TestProg_led_ this, string name ) {
    uint8 xx;
    uint8 c;
    
    printf("%s\n", name) ;

    c = (this->red);
    printf("%s %d\n", "red", c) ;

    (c) = (this->green);
    printf("%s %d\n", "green", c) ;

    (c) = (this->blue);
    printf("%s %d\n", "blue", c) ;

}

uint8 test50_TestProg_led_test_led__I( test50_TestProg_led_ this ) {
    (this->blue) = 2;
}

void test50_TestProg_test__E() {
    test50_TestProg_led_print_led__I(&(test50_TestProg_hll__V), test50_TestProg__s__1);
     exit(0) ;

}

void test50_TestProg_pollen__run__E() {
    test50_TestProg_test__E();
}

test50_TestProg_led_ test50_TestProg_led_new___I( test50_TestProg_led_ this ) {
    (this->red) = 3;
    return this;
}

void test50_TestProg_targetInit__I() {
    printf("%s\n", "TestProg") ;

}

