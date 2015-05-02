
/*
 * ======== string literals ========
 */

static const char test96_Test__s__fileName[] = "Test.p";
static const char test96_Test__s__17[] = "Check host_cls3.i after bar()";
static const char test96_Test__s__0[] = ".i: ";
static const char test96_Test__s__3[] = "foo(): set ";
static const char test96_Test__s__11[] = "Check host_cls.i after foo()";
static const char test96_Test__s__2[] = "Cls";
static const char test96_Test__s__5[] = "bar(): take Cls parameter p (by reference) and change it to host_cls2";
static const char test96_Test__s__7[] = "fun(): take Cls parameter p (by reference) and change field value to 11";
static const char test96_Test__s__4[] = ".i to ";
static const char test96_Test__s__13[] = "Assign host_cls2 to host_cls";
static const char test96_Test__s__6[] = "bar() parameter, display p ";
static const char test96_Test__s__8[] = "fun() parameter, display p ";
static const char test96_Test__s__12[] = "host_cls";
static const char test96_Test__s__10[] = "cls";
static const char test96_Test__s__18[] = "Check host_cls.i after bar()";
static const char test96_Test__s__16[] = "host_cls3";
static const char test96_Test__s__19[] = "Test";
static const char test96_Test__s__14[] = "host_cls2";
static const char test96_Test__s__9[] = "set cls to host_cls";
static const char test96_Test__s__15[] = "Check host_cls3.i for initial value";
static const char test96_Test__s__1[] = "\n";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test96_Test_bar__E( test96_Test_Cls_ p ) {
    test96_Test_pollen__printStr((string)test96_Test__s__5);
	test96_Test_pollen__printStr((string)test96_Test__s__1);
    (p) = &(test96_Test_host_cls2__V);
    test96_Test_Cls_print_i__E(p, test96_Test__s__6);
}

void test96_Test_pollen__run__E() {
    test96_Test_pollen__printStr((string)test96_Test__s__9);
	test96_Test_pollen__printStr((string)test96_Test__s__1);
    (test96_Test_cls__V) = &(test96_Test_host_cls__V);
    test96_Test_Cls_print_i__E(test96_Test_cls__V, test96_Test__s__10);
    (test96_Test_host_cls__V) = *(test96_Test_cls__V);
    test96_Test_foo__E((test96_Test_cls__V), test96_Test__s__10);
    test96_Test_Cls_print_i__E(test96_Test_cls__V, test96_Test__s__10);
    test96_Test_pollen__printStr((string)test96_Test__s__11);
	test96_Test_pollen__printStr((string)test96_Test__s__1);
    test96_Test_Cls_print_i__E(&(test96_Test_host_cls__V), test96_Test__s__12);
    test96_Test_pollen__printStr((string)test96_Test__s__13);
	test96_Test_pollen__printStr((string)test96_Test__s__1);
    (test96_Test_host_cls2__V) = (test96_Test_host_cls__V);
    test96_Test_Cls_print_i__E(&(test96_Test_host_cls2__V), test96_Test__s__14);
    test96_Test_pollen__printStr((string)test96_Test__s__1);
    test96_Test_pollen__printStr((string)test96_Test__s__15);
	test96_Test_pollen__printStr((string)test96_Test__s__1);
    test96_Test_Cls_print_i__E(&(test96_Test_host_cls3__V), test96_Test__s__16);
    test96_Test_bar__E(&(test96_Test_host_cls3__V));
    test96_Test_pollen__printStr((string)test96_Test__s__17);
	test96_Test_pollen__printStr((string)test96_Test__s__1);
    test96_Test_Cls_print_i__E(&(test96_Test_host_cls3__V), test96_Test__s__16);
    test96_Test_fun__E(&(test96_Test_host_cls3__V));
    test96_Test_pollen__printStr((string)test96_Test__s__17);
	test96_Test_pollen__printStr((string)test96_Test__s__1);
    test96_Test_Cls_print_i__E(&(test96_Test_host_cls3__V), test96_Test__s__16);
    test96_Test_pollen__printStr((string)test96_Test__s__1);
    test96_Test_Cls_set_i__E(&(test96_Test_host_cls__V), 12);
    test96_Test_Cls_print_i__E(&(test96_Test_host_cls__V), test96_Test__s__12);
    test96_Test_bar__E(&(test96_Test_host_cls__V));
    test96_Test_pollen__printStr((string)test96_Test__s__18);
	test96_Test_pollen__printStr((string)test96_Test__s__1);
    test96_Test_Cls_print_i__E(&(test96_Test_host_cls__V), test96_Test__s__12);
    test96_Test_fun__E(&(test96_Test_host_cls__V));
    test96_Test_pollen__printStr((string)test96_Test__s__18);
	test96_Test_pollen__printStr((string)test96_Test__s__1);
    test96_Test_Cls_print_i__E(&(test96_Test_host_cls__V), test96_Test__s__12);
     exit(0) ;

}

void test96_Test_foo__E( test96_Test_Cls_ p, string s ) {
    test96_Test_pollen__printStr((string)test96_Test__s__3);
	test96_Test_pollen__printStr((string)(s));
	test96_Test_pollen__printStr((string)test96_Test__s__4);
	test96_Test_pollen__printInt((int32)9);
	test96_Test_pollen__printStr((string)test96_Test__s__1);
    test96_Test_Cls_set_i__E(p, 9);
}

void test96_Test_Cls_set_i__E( test96_Test_Cls_ this, uint8 j ) {
    (this->i) = (j);
}

void test96_Test_Cls_print_i__E( test96_Test_Cls_ this, string n ) {
    test96_Test_pollen__printStr((string)(n));
	test96_Test_pollen__printStr((string)test96_Test__s__0);
	test96_Test_pollen__printUint((uint32)(this->i));
	test96_Test_pollen__printStr((string)test96_Test__s__1);
}

test96_Test_Cls_ test96_Test_Cls_new___E( test96_Test_Cls_ this ) {
    return this;
}

void test96_Test_targetInit__I() {
}

void test96_Test_fun__E( test96_Test_Cls_ p ) {
    test96_Test_pollen__printStr((string)test96_Test__s__7);
	test96_Test_pollen__printStr((string)test96_Test__s__1);
    test96_Test_Cls_set_i__E(p, 11);
    test96_Test_Cls_print_i__E(p, test96_Test__s__8);
}

