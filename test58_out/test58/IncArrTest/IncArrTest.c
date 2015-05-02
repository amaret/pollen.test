
/*
 * ======== string literals ========
 */

static const char test58_IncArrTest__s__fileName[] = "IncArrTest.p";
static const char test58_IncArrTest__s__0[] = "IncArrTest";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 

/*
 * ======== function definitions ========
 */

void test58_IncArrTest_foo__E() {
    (test58_IncArrTest_arr__A[0])++;
     printf("%d ", test58_IncArrTest_arr__A[0]) ;

    ++(test58_IncArrTest_arr__A[0]);
     printf("%d", test58_IncArrTest_arr__A[0]) ;

}

void test58_IncArrTest_targetInit__I() {
}

