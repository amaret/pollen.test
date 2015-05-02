
/*
 * ======== string literals ========
 */

static const char test56_On2__s__fileName[] = "On2.p";
static const char test56_On2__s__2[] = "On2";
static const char test56_On2__s__0[] = ">>In On2.on(), with arg ";
static const char test56_On2__s__1[] = "\n";

/*
 * ======== function definitions ========
 */

void test56_On2_targetInit__I() {
}

void test56_On2_on__E( uint8 i ) {
    test56_TestProg_pollen__printStr((string)test56_On2__s__0);
	test56_TestProg_pollen__printUint((uint32)(i));
	test56_TestProg_pollen__printStr((string)test56_On2__s__1);
}

