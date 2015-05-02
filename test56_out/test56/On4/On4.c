
/*
 * ======== string literals ========
 */

static const char test56_On4__s__fileName[] = "On4.p";
static const char test56_On4__s__0[] = ">>In On4.on(), with arg ";
static const char test56_On4__s__2[] = "On4";
static const char test56_On4__s__1[] = "\n";

/*
 * ======== function definitions ========
 */

void test56_On4_targetInit__I() {
}

void test56_On4_on__E( uint8 i ) {
    test56_TestProg_pollen__printStr((string)test56_On4__s__0);
	test56_TestProg_pollen__printUint((uint32)(i));
	test56_TestProg_pollen__printStr((string)test56_On4__s__1);
}

