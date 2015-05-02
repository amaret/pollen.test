
/*
 * ======== string literals ========
 */

static const char test76_FcnArrParm__s__fileName[] = "FcnArrParm.p";
static const char test76_FcnArrParm__s__6[] = "Print host array in module scope: \n";
static const char test76_FcnArrParm__s__3[] = ", arr[2] ";
static const char test76_FcnArrParm__s__2[] = ", arr[1] ";
static const char test76_FcnArrParm__s__1[] = "arr[0] ";
static const char test76_FcnArrParm__s__5[] = "Print host array passed as parameter: \n";
static const char test76_FcnArrParm__s__0[] = "Print targ array passed as parameter: \n";
static const char test76_FcnArrParm__s__7[] = "FcnArrParm";
static const char test76_FcnArrParm__s__4[] = "\n";

/*
 * ======== function definitions ========
 */

void test76_FcnArrParm_foo__E() {
    (test76_FcnArrParm_arr__V) = (test76_FcnArrParm_arrh__A);
    test76_FcnArrParm_bar_targ__E((test76_FcnArrParm_arr__V));
    test76_FcnArrParm_bar_host__E((test76_FcnArrParm_arrh__A));
}

void test76_FcnArrParm_bar_targ__E( uint8  arr[] ) {
    test76_Test_pollen__printStr((string)test76_FcnArrParm__s__0);
    test76_Test_pollen__printStr((string)test76_FcnArrParm__s__1);
	test76_Test_pollen__printUint((uint32)(arr[0]));
	test76_Test_pollen__printStr((string)test76_FcnArrParm__s__2);
	test76_Test_pollen__printUint((uint32)(arr[1]));
	test76_Test_pollen__printStr((string)test76_FcnArrParm__s__3);
	test76_Test_pollen__printUint((uint32)(arr[2]));
	test76_Test_pollen__printStr((string)test76_FcnArrParm__s__4);
}

void test76_FcnArrParm_bar_host__E( uint8  arr[] ) {
    uint8 i;
    test76_Test_pollen__printStr((string)test76_FcnArrParm__s__5);
    test76_Test_pollen__printStr((string)test76_FcnArrParm__s__1);
	test76_Test_pollen__printUint((uint32)(arr[0]));
	test76_Test_pollen__printStr((string)test76_FcnArrParm__s__2);
	test76_Test_pollen__printUint((uint32)(arr[1]));
	test76_Test_pollen__printStr((string)test76_FcnArrParm__s__3);
	test76_Test_pollen__printUint((uint32)(arr[2]));
	test76_Test_pollen__printStr((string)test76_FcnArrParm__s__4);
    test76_Test_pollen__printStr((string)test76_FcnArrParm__s__6);
    i = (arr[0]);
    test76_Test_pollen__printStr((string)test76_FcnArrParm__s__1);
	test76_Test_pollen__printUint((uint32)(i));
	test76_Test_pollen__printStr((string)test76_FcnArrParm__s__2);
	test76_Test_pollen__printUint((uint32)(arr[1]));
	test76_Test_pollen__printStr((string)test76_FcnArrParm__s__3);
	test76_Test_pollen__printUint((uint32)(arr[2]));
	test76_Test_pollen__printStr((string)test76_FcnArrParm__s__4);
}

void test76_FcnArrParm_targetInit__I() {
}

