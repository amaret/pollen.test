
/*
 * ======== string literals ========
 */

static const char test56_On3__s__fileName[] = "On3.p";
static const char test56_On3__s__2[] = "On3";
static const char test56_On3__s__0[] = ">>In On3.on(), with arg ";
static const char test56_On3__s__1[] = "\n";

/*
 * ======== function definitions ========
 */

void test56_On3_targetInit__I() {
}

void test56_On3_on__E( uint8 i ) {
    test56_TestProg_pollen__printStr((string)test56_On3__s__0);
	test56_TestProg_pollen__printUint((uint32)(i));
	test56_TestProg_pollen__printStr((string)test56_On3__s__1);
}

