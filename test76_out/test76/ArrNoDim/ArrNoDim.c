
/*
 * ======== string literals ========
 */

static const char test76_ArrNoDim__s__fileName[] = "ArrNoDim.p";
static const char test76_ArrNoDim__s__3[] = ", arr[2] ";
static const char test76_ArrNoDim__s__2[] = ", arr[1] ";
static const char test76_ArrNoDim__s__1[] = "arr[0] ";
static const char test76_ArrNoDim__s__0[] = "Print array without dimensions, elements assigned to host array: \n";
static const char test76_ArrNoDim__s__4[] = "\n";
static const char test76_ArrNoDim__s__5[] = "ArrNoDim";

/*
 * ======== function definitions ========
 */

void test76_ArrNoDim_foo__E() {
    uint8 i;
    uint8 j;
    uint8 k;
    (test76_ArrNoDim_arr__V) = (test76_ArrNoDim_arrh__A);
    i = (test76_ArrNoDim_arr__V[0]);
    j = (test76_ArrNoDim_arr__V[1]);
    k = (test76_ArrNoDim_arr__V[2]);
    test76_Test_pollen__printStr((string)test76_ArrNoDim__s__0);
    test76_Test_pollen__printStr((string)test76_ArrNoDim__s__1);
	test76_Test_pollen__printUint((uint32)(i));
	test76_Test_pollen__printStr((string)test76_ArrNoDim__s__2);
	test76_Test_pollen__printUint((uint32)(j));
	test76_Test_pollen__printStr((string)test76_ArrNoDim__s__3);
	test76_Test_pollen__printUint((uint32)(k));
	test76_Test_pollen__printStr((string)test76_ArrNoDim__s__4);
}

void test76_ArrNoDim_targetInit__I() {
}

