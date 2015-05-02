
/*
 * ======== string literals ========
 */

static const char test60_TestProg__s__fileName[] = "TestProg.p";
static const char test60_TestProg__s__5[] = "TestProg";
static const char test60_TestProg__s__2[] = "TestProg hostInit: ";
static const char test60_TestProg__s__0[] = "PASS";
static const char test60_TestProg__s__4[] = "pollen.run: test_freq ";
static const char test60_TestProg__s__3[] = "\n";
static const char test60_TestProg__s__1[] = "FAIL";

/*
 * ======== function definitions ========
 */

void test60_TestProg_pollen__run__E() {
    test60_TestProg_pollen__printStr((string)test60_TestProg__s__4);
	test60_TestProg_pollen__printUint((uint32)(test60_TestProg_test_freq__V));
	test60_TestProg_pollen__printStr((string)test60_TestProg__s__3);
}

void test60_TestProg_targetInit__I() {
}

