
/*
 * ======== string literals ========
 */

static const char test97_Test__s__fileName[] = "Test.p";
static const char test97_Test__s__17[] = "assign host_cls = arrClsTarg[1]\n";
static const char test97_Test__s__0[] = ".i: ";
static const char test97_Test__s__4[] = "Cls";
static const char test97_Test__s__5[] = "arrClsHost[0]";
static const char test97_Test__s__6[] = "arrClsHost[1]";
static const char test97_Test__s__7[] = "arrClsHost[2]";
static const char test97_Test__s__2[] = "set ";
static const char test97_Test__s__3[] = ".i to ";
static const char test97_Test__s__8[] = "assign arrClsTarg[0] = arrClsHost[0]\n";
static const char test97_Test__s__9[] = "arrClsTarg[0]";
static const char test97_Test__s__16[] = "host_cls";
static const char test97_Test__s__10[] = "assign arrClsTarg[1] = arrClsHost[1]\n";
static const char test97_Test__s__14[] = "\nNow set the host arrary elements to the target array elements:\n";
static const char test97_Test__s__13[] = "arrClsTarg[2]";
static const char test97_Test__s__18[] = "Test";
static const char test97_Test__s__11[] = "arrClsTarg[1]";
static const char test97_Test__s__15[] = "assign host_cls = arrClsHost[2]\n";
static const char test97_Test__s__1[] = "\n";
static const char test97_Test__s__12[] = "assign arrClsTarg[2] = arrClsHost[2]\n";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test97_Test_bar__E() {
}

void test97_Test_pollen__run__E() {
     exit(0) ;

}

void test97_Test_Cls_set_i__E( test97_Test_Cls_ this, uint8 j, string n ) {
    (this->i) = (j);
    test97_Test_pollen__printStr((string)test97_Test__s__2);
	test97_Test_pollen__printStr((string)(n));
	test97_Test_pollen__printStr((string)test97_Test__s__3);
	test97_Test_pollen__printUint((uint32)(this->i));
	test97_Test_pollen__printStr((string)test97_Test__s__1);
}

void test97_Test_Cls_print_i__E( test97_Test_Cls_ this, string n ) {
    test97_Test_pollen__printStr((string)(n));
	test97_Test_pollen__printStr((string)test97_Test__s__0);
	test97_Test_pollen__printUint((uint32)(this->i));
	test97_Test_pollen__printStr((string)test97_Test__s__1);
}

test97_Test_Cls_ test97_Test_Cls_new___E( test97_Test_Cls_ this ) {
    return this;
}

void test97_Test_targetInit__I() {
    (test97_Test_arrClsTargNoDim__V) = (test97_Test_arrClsTarg__A);
    (test97_Test_cls__V) = &(test97_Test_arrClsHost__A[0]);
    test97_Test_Cls_set_i__E(test97_Test_cls__V, 22, test97_Test__s__5);
    (test97_Test_cls__V) = &(test97_Test_arrClsHost__A[1]);
    test97_Test_Cls_set_i__E(test97_Test_cls__V, 23, test97_Test__s__6);
    (test97_Test_cls__V) = &(test97_Test_arrClsHost__A[2]);
    test97_Test_Cls_set_i__E(test97_Test_cls__V, 24, test97_Test__s__7);
    test97_Test_pollen__printStr((string)test97_Test__s__8);
    (test97_Test_arrClsTarg__A[0]) = &(test97_Test_arrClsHost__A[0]);
    (test97_Test_cls__V) = (test97_Test_arrClsTarg__A[0]);
    test97_Test_Cls_print_i__E(test97_Test_cls__V, test97_Test__s__9);
    test97_Test_Cls_set_i__E(test97_Test_cls__V, 32, test97_Test__s__9);
    test97_Test_pollen__printStr((string)test97_Test__s__10);
    (test97_Test_arrClsTarg__A[1]) = &(test97_Test_arrClsHost__A[1]);
    (test97_Test_cls__V) = (test97_Test_arrClsTarg__A[1]);
    test97_Test_Cls_print_i__E(test97_Test_cls__V, test97_Test__s__11);
    test97_Test_Cls_set_i__E(test97_Test_cls__V, 33, test97_Test__s__11);
    test97_Test_pollen__printStr((string)test97_Test__s__12);
    (test97_Test_arrClsTarg__A[2]) = &(test97_Test_arrClsHost__A[2]);
    (test97_Test_cls__V) = (test97_Test_arrClsTarg__A[2]);
    test97_Test_Cls_print_i__E(test97_Test_cls__V, test97_Test__s__13);
    test97_Test_Cls_set_i__E(test97_Test_cls__V, 34, test97_Test__s__13);
    test97_Test_pollen__printStr((string)test97_Test__s__14);
    (test97_Test_arrClsHost__A[0]) = *(test97_Test_arrClsTarg__A[0]);
    (test97_Test_cls__V) = &(test97_Test_arrClsHost__A[0]);
    test97_Test_Cls_print_i__E(test97_Test_cls__V, test97_Test__s__5);
    (test97_Test_arrClsHost__A[1]) = *(test97_Test_arrClsTarg__A[1]);
    (test97_Test_cls__V) = &(test97_Test_arrClsHost__A[1]);
    test97_Test_Cls_print_i__E(test97_Test_cls__V, test97_Test__s__6);
    (test97_Test_arrClsHost__A[2]) = *(test97_Test_arrClsTarg__A[2]);
    (test97_Test_cls__V) = &(test97_Test_arrClsHost__A[2]);
    test97_Test_Cls_print_i__E(test97_Test_cls__V, test97_Test__s__7);
    (test97_Test_cls__V) = &(test97_Test_arrClsHost__A[2]);
    (test97_Test_cls__V) = (test97_Test_arrClsTarg__A[0]);
    test97_Test_pollen__printStr((string)test97_Test__s__15);
    (test97_Test_host_cls__V) = (test97_Test_arrClsHost__A[2]);
    test97_Test_Cls_print_i__E(&(test97_Test_host_cls__V), test97_Test__s__16);
    test97_Test_pollen__printStr((string)test97_Test__s__17);
    (test97_Test_host_cls__V) = *(test97_Test_arrClsTarg__A[1]);
    test97_Test_Cls_print_i__E(&(test97_Test_host_cls__V), test97_Test__s__16);
}

void test97_Test_fun__E( test97_Test_Cls_ p ) {
}

