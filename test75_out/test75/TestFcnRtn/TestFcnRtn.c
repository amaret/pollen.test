
/*
 * ======== string literals ========
 */

static const char test75_TestFcnRtn__s__fileName[] = "TestFcnRtn.p";
static const char test75_TestFcnRtn__s__4[] = "print arg is returned (bool) value: ";
static const char test75_TestFcnRtn__s__2[] = "print arg is returned (uint8) value: ";
static const char test75_TestFcnRtn__s__7[] = "TestFcnRtn";
static const char test75_TestFcnRtn__s__0[] = "c2, 1st call to test";
static const char test75_TestFcnRtn__s__6[] = "print arg is returned (uint8) field: ";
static const char test75_TestFcnRtn__s__5[] = "args use fcn call return object c2: \n";
static const char test75_TestFcnRtn__s__1[] = "args use local class instance object c1: \n";
static const char test75_TestFcnRtn__s__3[] = "\n";

/*
 * ======== function definitions ========
 */

void test75_TestFcnRtn_foo__E() {
    (test75_TestFcnRtn_c2__V) = test75_Cls1_Cls1_returnMe__E(&(test75_TestFcnRtn_c1__V));
    test75_Cls1_Cls1_test__E(test75_TestFcnRtn_c2__V, test75_TestFcnRtn__s__0);
    (test75_TestFcnRtn_r1__V) = test75_Cls1_Cls1_returnUint8__E(&(test75_TestFcnRtn_c1__V));
    (test75_TestFcnRtn_r2__V) = test75_Cls1_Cls1_returnBool__E(&(test75_TestFcnRtn_c1__V));
    test75_Test_pollen__printStr((string)test75_TestFcnRtn__s__1);
    test75_Test_pollen__printStr((string)test75_TestFcnRtn__s__2);
	test75_Test_pollen__printUint((uint32)(test75_TestFcnRtn_r1__V));
	test75_Test_pollen__printStr((string)test75_TestFcnRtn__s__3);
    test75_Test_pollen__printStr((string)test75_TestFcnRtn__s__4);
	test75_Test_pollen__printBool((test75_TestFcnRtn_r2__V));
	test75_Test_pollen__printStr((string)test75_TestFcnRtn__s__3);
    (test75_TestFcnRtn_r1__V) = test75_Cls1_Cls1_returnUint8__E(test75_TestFcnRtn_c2__V);
    (test75_TestFcnRtn_r2__V) = test75_Cls1_Cls1_returnBool__E(test75_TestFcnRtn_c2__V);
    test75_Test_pollen__printStr((string)test75_TestFcnRtn__s__5);
    test75_Test_pollen__printStr((string)test75_TestFcnRtn__s__2);
	test75_Test_pollen__printUint((uint32)(test75_TestFcnRtn_r1__V));
	test75_Test_pollen__printStr((string)test75_TestFcnRtn__s__3);
    test75_Test_pollen__printStr((string)test75_TestFcnRtn__s__4);
	test75_Test_pollen__printBool((test75_TestFcnRtn_r2__V));
	test75_Test_pollen__printStr((string)test75_TestFcnRtn__s__3);
    (test75_TestFcnRtn_r1__V) = test75_Cls1_Cls1_returnFld__E(test75_TestFcnRtn_c2__V, &(test75_TestFcnRtn_c1__V));
    test75_Test_pollen__printStr((string)test75_TestFcnRtn__s__6);
	test75_Test_pollen__printUint((uint32)(test75_TestFcnRtn_r1__V));
	test75_Test_pollen__printStr((string)test75_TestFcnRtn__s__3);
}

void test75_TestFcnRtn_targetInit__I() {
}

