
/*
 * ======== string literals ========
 */

static const char test56_On1__s__fileName[] = "On1.p";
static const char test56_On1__s__3[] = ">>In On1.on_2_0(), host fcn, no args \n";
static const char test56_On1__s__5[] = "On1";
static const char test56_On1__s__4[] = ">>In On1.on_2_1(), targ fcn, no args \n";
static const char test56_On1__s__2[] = ">>In On1.on_0(), no args \n";
static const char test56_On1__s__0[] = ">>In On1.on(), with arg ";
static const char test56_On1__s__1[] = "\n";

/*
 * ======== function definitions ========
 */

void test56_On1_on_0__E() {
    test56_TestProg_pollen__printStr((string)test56_On1__s__2);
}

void test56_On1_on_2_1__E() {
    test56_TestProg_pollen__printStr((string)test56_On1__s__4);
}

void test56_On1_targetInit__I() {
}

void test56_On1_on__E( uint8 i ) {
    test56_TestProg_pollen__printStr((string)test56_On1__s__0);
	test56_TestProg_pollen__printUint((uint32)(i));
	test56_TestProg_pollen__printStr((string)test56_On1__s__1);
}

