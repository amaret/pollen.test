
/*
 * ======== string literals ========
 */

static const char test95_Test__s__fileName[] = "Test.p";
static const char test95_Test__s__1[] = "Test";
static const char test95_Test__s__0[] = "\n";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test95_Test_pollen__run__E() {
    (test95_Test_cls__V) = &(test95_Test_host_cls__V);
    (test95_Test_cls__V) = (test95_Arr_Cls_) &(test95_Test_arr__A);
    test95_Test_pollen__printUint((uint32)(test95_Test_Test_i__V));
	test95_Test_pollen__printStr((string)test95_Test__s__0);
    test95_Arr_checkAccess__E();
    test95_ArrMod_foo__E();
     exit(0) ;

}

void test95_Test_targetInit__I() {
}

