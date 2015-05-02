
/*
 * ======== string literals ========
 */

static const char test53_TestProg__s__fileName[] = "TestProg.p";
static const char test53_TestProg__s__1[] = "TestProg";
static const char test53_TestProg__s__0[] = "Nest";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 

/*
 * ======== function definitions ========
 */

void test53_TestProg_fcnpeg__I( uint8  arr[] ) {
    uint8 * local;
    
    (local) = (uint8*) (arr);
}

void test53_TestProg_pollen__run__E() {
    uint16 * b;
    (test53_TestProg_n1__V) = &(test53_TestProg_n_host__V);
    (test53_TestProg_n1__V) = (test53_TestProg_Nest_) &(test53_TestProg_arr1__A[0]);
    (test53_TestProg_n_host__V) = (test53_TestProg_Nest) &(test53_TestProg_arr1__A[4]);
    (test53_TestProg_m1__V) = (test53_Mod1_) &(test53_TestProg_arr1__A[0]);
    (test53_TestProg_n__V) = (test53_TestProg_Nest_) &(test53_TestProg_arr1__A[1]);
    (test53_TestProg_n_host__V) = (test53_TestProg_Nest) &(test53_TestProg_arr1__A[16]);
    uint8 a[2] = { 0, 0 };
    
    (b) = (uint16*) (a);
    (a[0]) = 0xAB;
    (a[1]) = 0xCD;
}

test53_TestProg_Nest_ test53_TestProg_Nest_new___E( test53_TestProg_Nest_ this ) {
    return this;
}

void test53_TestProg_targetInit__I() {
}

