
/*
 * ======== string literals ========
 */

static const char test56_TestProg__s__fileName[] = "TestProg.p";
static const char test56_TestProg__s__6[] = "7. Protocol function type for function ref Array, with arg=array index.\n";
static const char test56_TestProg__s__1[] = "2. Init on1_fref with assignment, then use it to call On1.on(), with arg=8.\n";
static const char test56_TestProg__s__3[] = "4. Init on2_fref with assignment, then use it to call On3.on(), with arg=7.\n";
static const char test56_TestProg__s__8[] = "9. Array of function refs init from function names, with arg=array index.\n";
static const char test56_TestProg__s__9[] = "TestProg";
static const char test56_TestProg__s__7[] = "8. Array of function refs init from function names, with arg=array index.\n";
static const char test56_TestProg__s__4[] = "5. Array of fcn refs: target array, target fcnrefs, target fcns, with arg=array index.\n";
static const char test56_TestProg__s__0[] = "1. Init on1_0_fref with assignment, then use it to call On1.on_0(), no args.\n";
static const char test56_TestProg__s__5[] = "6. Array of fcn refs: host array, host fcnrefs, target fcns, with arg=array index.\n";
static const char test56_TestProg__s__2[] = "3. Init on2_fref on dcln, then use it to call On2.on(), with arg=3.\n";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test56_TestProg_pollen__run__E() {
    uint8 i;
    test56_TestProg_pollen__printStr((string)test56_TestProg__s__0);
    (test56_TestProg_on1_0_fref__V) = (test56_On1_on_0__E);
    test56_TestProg_on1_0_fref__V();
    test56_TestProg_pollen__printStr((string)test56_TestProg__s__1);
    (test56_TestProg_on1_fref__V) = (test56_On1_on__E);
    test56_TestProg_on1_fref__V(8);
    test56_TestProg_pollen__printStr((string)test56_TestProg__s__2);
    test56_TestProg_on2_fref__V(3);
    test56_TestProg_pollen__printStr((string)test56_TestProg__s__3);
    (test56_TestProg_on2_fref__V) = (test56_On3_on__E);
    test56_TestProg_on2_fref__V(7);
    test56_TestProg_pollen__printStr((string)test56_TestProg__s__4);
    for (i = 0; (i) < 3; (i)++) {
        (*test56_TestProg_on_functions__A[(i)])(i);
    }
    test56_TestProg_pollen__printStr((string)test56_TestProg__s__5);
    for ((i) = 0; (i) < 3; (i)++) {
        (*test56_TestProg_on_host_functions__A[(i)])(i);
    }
    test56_TestProg_pollen__printStr((string)test56_TestProg__s__6);
    for ((i) = 0; (i) < 3; (i)++) {
        (*test56_TestProg_on_functions_proto__A[(i)])(i);
    }
    test56_TestProg_pollen__printStr((string)test56_TestProg__s__7);
    for ((i) = 0; (i) < 4; (i)++) {
        (*test56_TestProg_on_function_by_name__A[(i)])(i);
    }
    test56_TestProg_pollen__printStr((string)test56_TestProg__s__8);
    (test56_TestProg_on_function_by_name__A[3]) = (test56_On5_on__E);
    for ((i) = 0; (i) < 4; (i)++) {
        (*test56_TestProg_on_function_by_name__A[(i)])(i);
    }
     exit(0) ;

}

void test56_TestProg_targetInit__I() {
}

