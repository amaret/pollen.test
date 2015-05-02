
/*
 * ======== string literals ========
 */

static const char test123_TestProg__s__fileName[] = "TestProg.p";
static const char test123_TestProg__s__3[] = "TestProg";
static const char test123_TestProg__s__2[] = "arr_u32[0]:";
static const char test123_TestProg__s__0[] = "arr_u16[1]: ";
static const char test123_TestProg__s__1[] = "\n";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 
 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test123_TestProg_pollen__run__E() {
    (test123_TestProg_arr_u16__V) = (uint16*) (test123_TestProg__arr_u8__A);
    test123_TestProg_pollen__printStr((string)test123_TestProg__s__0);
	test123_TestProg_pollen__printUint((uint32)(test123_TestProg_arr_u16__V[1]));
	test123_TestProg_pollen__printStr((string)test123_TestProg__s__1);
    (test123_TestProg_arr_u32__V) = (uint32*) (test123_TestProg__arr_u8__A);
    test123_TestProg_pollen__printStr((string)test123_TestProg__s__2);
	test123_TestProg_pollen__printUint((uint32)(test123_TestProg_arr_u32__V[0]));
	test123_TestProg_pollen__printStr((string)test123_TestProg__s__1);
    (test123_TestProg_arr_b__V) = (bool*) (test123_TestProg__arr_u8__A);
    test123_TestProg_pollen__printBool((test123_TestProg_arr_b__V[0]));
	test123_TestProg_pollen__printStr((string)test123_TestProg__s__1);
    (test123_TestProg__arr_u8__A[0]) = 1;
    test123_TestProg_pollen__printBool((test123_TestProg_arr_b__V[0]));
	test123_TestProg_pollen__printStr((string)test123_TestProg__s__1);
     exit(0) ;

}

void test123_TestProg_targetInit__I() {
}

