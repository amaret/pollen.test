
/*
 * ======== string literals ========
 */

static const char test56_On5__s__fileName[] = "On5.p";
static const char test56_On5__s__0[] = ">>In On5.on(), with arg ";
static const char test56_On5__s__2[] = "On5";
static const char test56_On5__s__1[] = "\n";

/*
 * ======== function definitions ========
 */

void test56_On5_targetInit__I() {
}

void test56_On5_on__E( uint8 i ) {
    test56_TestProg_pollen__printStr((string)test56_On5__s__0);
	test56_TestProg_pollen__printUint((uint32)(i));
	test56_TestProg_pollen__printStr((string)test56_On5__s__1);
}

