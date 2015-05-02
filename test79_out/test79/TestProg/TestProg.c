
/*
 * ======== string literals ========
 */

static const char test79_TestProg__s__fileName[] = "TestProg.p";
static const char test79_TestProg__s__1[] = "Test this string";
static const char test79_TestProg__s__5[] = "Now print out the test data\n";
static const char test79_TestProg__s__3[] = " ";
static const char test79_TestProg__s__13[] = "Now print out a uint8 value function return: ";
static const char test79_TestProg__s__12[] = "Now print out a boolean value function return: ";
static const char test79_TestProg__s__11[] = "Now print out a boolean value: ";
static const char test79_TestProg__s__15[] = "TestProg";
static const char test79_TestProg__s__2[] = "enter pollen.run, print some stuff\n";
static const char test79_TestProg__s__0[] = "Nest";
static const char test79_TestProg__s__8[] = "(signed):\n";
static const char test79_TestProg__s__9[] = "Now print out the Nest class field aNum\n";
static const char test79_TestProg__s__6[] = "(unsigned):\n";
static const char test79_TestProg__s__10[] = " \n";
static const char test79_TestProg__s__7[] = "\n";
static const char test79_TestProg__s__14[] = "Now (fail to) print out a agg function return: ";
static const char test79_TestProg__s__4[] = "EOL\n";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

uint8 test79_TestProg_getAge__I() {
    return(  7  );
}

void test79_TestProg_pollen__run__E() {
    bool f;
    test79_TestProg_pollen__printStr((string)test79_TestProg__s__2);
    test79_TestProg_pollen__printStr((string)test79_TestProg__s__3);
	test79_TestProg_pollen__printStr((string)(test79_TestProg_s1__V));
	test79_TestProg_pollen__printStr((string)test79_TestProg__s__3);
	test79_TestProg_pollen__printUint((uint32)(test79_TestProg_aNest_aNum__V));
	test79_TestProg_pollen__printStr((string)test79_TestProg__s__4);
    test79_TestProg_pollen__printStr((string)test79_TestProg__s__5);
    test79_TestProg_pollen__printStr((string)test79_TestProg__s__6);
    test79_TestProg_pollen__printUint((uint32)(test79_TestProg_u8__V));
	test79_TestProg_pollen__printStr((string)test79_TestProg__s__3);
	test79_TestProg_pollen__printUint((uint32)(test79_TestProg_u16__V));
	test79_TestProg_pollen__printStr((string)test79_TestProg__s__3);
	test79_TestProg_pollen__printUint((uint32)(test79_TestProg_u32__V));
	test79_TestProg_pollen__printStr((string)test79_TestProg__s__7);
    test79_TestProg_pollen__printStr((string)test79_TestProg__s__8);
    test79_TestProg_pollen__printInt((int32)(test79_TestProg_i8__V));
	test79_TestProg_pollen__printStr((string)test79_TestProg__s__3);
	test79_TestProg_pollen__printInt((int32)(test79_TestProg_i16__V));
	test79_TestProg_pollen__printStr((string)test79_TestProg__s__3);
	test79_TestProg_pollen__printInt((int32)(test79_TestProg_i32__V));
	test79_TestProg_pollen__printStr((string)test79_TestProg__s__7);
    test79_TestProg_pollen__printStr((string)test79_TestProg__s__9);
    test79_TestProg_pollen__printUint((uint32)(test79_TestProg_aNest_aNum__V));
	test79_TestProg_pollen__printStr((string)test79_TestProg__s__10);
    f = test79_TestProg_Nest_getFlag__I(&(test79_TestProg_aNest__V));
    test79_TestProg_pollen__printStr((string)test79_TestProg__s__11);
	test79_TestProg_pollen__printBool((f));
	test79_TestProg_pollen__printStr((string)test79_TestProg__s__7);
    test79_TestProg_pollen__printStr((string)test79_TestProg__s__12);
	test79_TestProg_pollen__printBool(test79_TestProg_Nest_getFlag__I(&(test79_TestProg_aNest__V)));
	test79_TestProg_pollen__printStr((string)test79_TestProg__s__7);
    test79_TestProg_pollen__printStr((string)test79_TestProg__s__13);
	test79_TestProg_pollen__printUint((uint32)test79_TestProg_getAge__I());
	test79_TestProg_pollen__printStr((string)test79_TestProg__s__7);
    test79_TestProg_pollen__printStr((string)test79_TestProg__s__14);
	test79_TestProg_pollen__printStr((string)test79_TestProg__s__7);
    test79_Junk_foo__E();
     exit(0) ;

}

test79_TestProg_Nest_ test79_TestProg_foo__I() {
    return&(  (test79_TestProg_aNest__V)  );
}

test79_TestProg_Nest_ test79_TestProg_Nest_new___E( test79_TestProg_Nest_ this ) {
    return this;
}

bool test79_TestProg_Nest_getFlag__I( test79_TestProg_Nest_ this ) {
    return(  (this->flag)  );
}

void test79_TestProg_targetInit__I() {
}

