
/*
 * ======== string literals ========
 */

static const char test55_TestProg__s__fileName[] = "TestProg.p";
static const char test55_TestProg__s__7[] = "n not 8 bit aligned";
static const char test55_TestProg__s__3[] = "assert n1 not 16 bit aligned";
static const char test55_TestProg__s__10[] = "TestProg";
static const char test55_TestProg__s__2[] = "assert n1 not 8 bit aligned";
static const char test55_TestProg__s__6[] = "2. peg n to byte array arr1 at index 1\n";
static const char test55_TestProg__s__8[] = "n not 16 bit aligned";
static const char test55_TestProg__s__0[] = "Nest";
static const char test55_TestProg__s__1[] = "1. peg n1 to byte array arr1 at index 0\n";
static const char test55_TestProg__s__4[] = "assert n1 not 32 bit aligned";
static const char test55_TestProg__s__5[] = "If no assert printed, address of n1 is 32 bit aligned\n\n";
static const char test55_TestProg__s__9[] = "n not 32 bit aligned";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 
 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test55_TestProg_pollen__run__E() {
    test55_TestProg_pollen__printStr((string)test55_TestProg__s__1);
    (test55_TestProg_n1__V) = (test55_TestProg_Nest_) &(test55_TestProg_arr1__A[0]);
    test55_TestProg_pollen__assert__E( ((int)(void*) test55_TestProg_n1__V) % test55_TestProg_ALIGN_8BIT__V == 0 , test55_TestProg__s__2);
    test55_TestProg_pollen__assert__E( ((int)(void*) test55_TestProg_n1__V) % 2 == 0 , test55_TestProg__s__3);
    test55_TestProg_pollen__assert__E( ((int)(void*) test55_TestProg_n1__V) % 4 == 0 , test55_TestProg__s__4);
    test55_TestProg_pollen__printStr((string)test55_TestProg__s__5);
    test55_TestProg_pollen__printStr((string)test55_TestProg__s__6);
    (test55_TestProg_n__V) = (test55_TestProg_Nest_) &(test55_TestProg_arr1__A[1]);
    test55_TestProg_pollen__assert__E( ((int)(void*) test55_TestProg_n__V) % 1 == 0 , test55_TestProg__s__7);
    test55_TestProg_pollen__assert__E( ((int)(void*) test55_TestProg_n__V) % 2 == 0 , test55_TestProg__s__8);
    test55_TestProg_pollen__assert__E( ((int)(void*) test55_TestProg_n__V) % 4 == 0 , test55_TestProg__s__9);
     exit(0) ;

}

test55_TestProg_Nest_ test55_TestProg_Nest_new___E( test55_TestProg_Nest_ this ) {
    return this;
}

void test55_TestProg_targetInit__I() {
}

