
/*
 * ======== string literals ========
 */

static const char test100_Test__s__fileName[] = "Test.p";
static const char test100_Test__s__0[] = "Elem";
static const char test100_Test__s__1[] = ".i: ";
static const char test100_Test__s__5[] = "set localClsHost elements to array ";
static const char test100_Test__s__6[] = "Cls";
static const char test100_Test__s__7[] = "cls";
static const char test100_Test__s__3[] = "set ";
static const char test100_Test__s__8[] = "Test";
static const char test100_Test__s__4[] = ".i to ";
static const char test100_Test__s__2[] = "\n";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test100_Test_Cls_set_arr__E( test100_Test_Cls_ this, test100_Test_Cls  arr[], string n ) {
    test100_Test_pollen__printStr((string)test100_Test__s__5);
	test100_Test_pollen__printStr((string)(n));
	test100_Test_pollen__printStr((string)test100_Test__s__2);
}

test100_Test_Cls_ test100_Test_Cls_bar__E( test100_Test_Cls_ this ) {
    return(  this  );
}

void test100_Test_pollen__run__E() {
     exit(0) ;

}

void test100_Test_foo__E( test100_Test_Cls  arr[], string n ) {
    (test100_Test_cls__V) = &(test100_Test_arrClsHost__A[0]);
    (test100_Test_cls__V) = test100_Test_Cls_bar__E(test100_Test_cls__V);
    test100_Test_Cls_print_i__E(test100_Test_Cls_bar__E(test100_Test_cls__V), test100_Test__s__7);
    test100_Test_Cls_print_i__E((test100_Test_Cls_bar__E(&((test100_Test_arrClsHost__A[0])))), test100_Test__s__7);
}

void test100_Test_Cls_set_i__E( test100_Test_Cls_ this, uint8 j, string n ) {
    (this->i) = (j);
    test100_Test_pollen__printStr((string)test100_Test__s__3);
	test100_Test_pollen__printStr((string)(n));
	test100_Test_pollen__printStr((string)test100_Test__s__4);
	test100_Test_pollen__printUint((uint32)(this->i));
	test100_Test_pollen__printStr((string)test100_Test__s__2);
}

void test100_Test_Cls_print_i__E( test100_Test_Cls_ this, string n ) {
    test100_Test_pollen__printStr((string)(n));
	test100_Test_pollen__printStr((string)test100_Test__s__1);
	test100_Test_pollen__printUint((uint32)(this->i));
	test100_Test_pollen__printStr((string)test100_Test__s__2);
}

test100_Test_Elem_ test100_Test_Elem_new___E( test100_Test_Elem_ this ) {
    return this;
}

test100_Test_Cls_ test100_Test_Cls_new___E( test100_Test_Cls_ this ) {
    return this;
}

void test100_Test_targetInit__I() {
}

test100_Test_Elem_  test100_Test_Cls_fun__E( test100_Test_Cls_ this ) {
    return(  this->localElemHost  );
}

