
/*
 * ======== string literals ========
 */

static const char test54_TestProg__s__fileName[] = "TestProg.p";
static const char test54_TestProg__s__1[] = "Test this string";
static const char test54_TestProg__s__5[] = "Now print out the test data\n";
static const char test54_TestProg__s__3[] = " ";
static const char test54_TestProg__s__11[] = "Now print out a boolean value: ";
static const char test54_TestProg__s__13[] = "TestProg";
static const char test54_TestProg__s__12[] = "Now (fail to) print out a boolean value: ";
static const char test54_TestProg__s__2[] = "enter pollen.run, print some stuff\n";
static const char test54_TestProg__s__0[] = "Nest";
static const char test54_TestProg__s__8[] = "(signed):\n";
static const char test54_TestProg__s__9[] = "Now print out the Nest class field aNum\n";
static const char test54_TestProg__s__6[] = "(unsigned):\n";
static const char test54_TestProg__s__10[] = " \n";
static const char test54_TestProg__s__7[] = "\n";
static const char test54_TestProg__s__4[] = "EOL\n";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test54_TestProg_pollen__run__E() {
    bool f;
    test54_TestProg_pollen__printStr((string)test54_TestProg__s__2);
    test54_TestProg_pollen__printStr((string)test54_TestProg__s__3);
	test54_TestProg_pollen__printStr((string)(test54_TestProg_s1__V));
	test54_TestProg_pollen__printStr((string)test54_TestProg__s__3);
	test54_TestProg_pollen__printUint((uint32)(test54_TestProg_aNest_aNum__V));
	test54_TestProg_pollen__printStr((string)test54_TestProg__s__4);
    test54_TestProg_pollen__printStr((string)test54_TestProg__s__5);
    test54_TestProg_pollen__printStr((string)test54_TestProg__s__6);
    test54_TestProg_pollen__printUint((uint32)(test54_TestProg_u8__V));
	test54_TestProg_pollen__printStr((string)test54_TestProg__s__3);
	test54_TestProg_pollen__printUint((uint32)(test54_TestProg_u16__V));
	test54_TestProg_pollen__printStr((string)test54_TestProg__s__3);
	test54_TestProg_pollen__printUint((uint32)(test54_TestProg_u32__V));
	test54_TestProg_pollen__printStr((string)test54_TestProg__s__7);
    test54_TestProg_pollen__printStr((string)test54_TestProg__s__8);
    test54_TestProg_pollen__printInt((int32)(test54_TestProg_i8__V));
	test54_TestProg_pollen__printStr((string)test54_TestProg__s__3);
	test54_TestProg_pollen__printInt((int32)(test54_TestProg_i16__V));
	test54_TestProg_pollen__printStr((string)test54_TestProg__s__3);
	test54_TestProg_pollen__printInt((int32)(test54_TestProg_i32__V));
	test54_TestProg_pollen__printStr((string)test54_TestProg__s__7);
    test54_TestProg_pollen__printStr((string)test54_TestProg__s__9);
    test54_TestProg_pollen__printUint((uint32)(test54_TestProg_aNest_aNum__V));
	test54_TestProg_pollen__printStr((string)test54_TestProg__s__10);
    f = test54_TestProg_Nest_getFlag__I(&(test54_TestProg_aNest__V));
    test54_TestProg_pollen__printStr((string)test54_TestProg__s__11);
	test54_TestProg_pollen__printBool((f));
	test54_TestProg_pollen__printStr((string)test54_TestProg__s__7);
    test54_TestProg_pollen__printStr((string)test54_TestProg__s__12);
	test54_TestProg_pollen__printBool(test54_TestProg_Nest_getFlag__I(&(test54_TestProg_aNest__V)));
	test54_TestProg_pollen__printStr((string)test54_TestProg__s__7);
    test54_Junk_foo__E();
     exit(0) ;

}

test54_TestProg_Nest_ test54_TestProg_Nest_new___E( test54_TestProg_Nest_ this ) {
    return this;
}

bool test54_TestProg_Nest_getFlag__I( test54_TestProg_Nest_ this ) {
    return(  (this->flag)  );
}

void test54_TestProg_targetInit__I() {
}

