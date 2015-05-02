
/*
 * ======== string literals ========
 */

static const char test99_Test__s__fileName[] = "Test.p";
static const char test99_Test__s__5[] = "\nIn foo(), print element 1 of ";
static const char test99_Test__s__0[] = ".i: ";
static const char test99_Test__s__4[] = "Cls";
static const char test99_Test__s__2[] = "set ";
static const char test99_Test__s__6[] = "arrClsHost";
static const char test99_Test__s__7[] = "Test";
static const char test99_Test__s__3[] = ".i to ";
static const char test99_Test__s__1[] = "\n";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test99_Test_pollen__run__E() {
     exit(0) ;

}

void test99_Test_foo__E( test99_Test_Cls  arr[], string n ) {
    test99_Test_pollen__printStr((string)test99_Test__s__5);
	test99_Test_pollen__printStr((string)(n));
	test99_Test_pollen__printStr((string)test99_Test__s__1);
    (test99_Test_cls__V) = &(arr[0]);
    test99_Test_Cls_print_i__E(test99_Test_cls__V, (n));
}

void test99_Test_Cls_set_i__E( test99_Test_Cls_ this, uint8 j, string n ) {
    (this->i) = (j);
    test99_Test_pollen__printStr((string)test99_Test__s__2);
	test99_Test_pollen__printStr((string)(n));
	test99_Test_pollen__printStr((string)test99_Test__s__3);
	test99_Test_pollen__printUint((uint32)(this->i));
	test99_Test_pollen__printStr((string)test99_Test__s__1);
}

void test99_Test_Cls_print_i__E( test99_Test_Cls_ this, string n ) {
    test99_Test_pollen__printStr((string)(n));
	test99_Test_pollen__printStr((string)test99_Test__s__0);
	test99_Test_pollen__printUint((uint32)(this->i));
	test99_Test_pollen__printStr((string)test99_Test__s__1);
}

test99_Test_Cls_ test99_Test_Cls_new___E( test99_Test_Cls_ this ) {
    return this;
}

void test99_Test_targetInit__I() {
    test99_Test_foo__E((test99_Test_arrClsHost__A), test99_Test__s__6);
}

