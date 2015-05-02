
/*
 * ======== string literals ========
 */

static const char test98_Test__s__fileName[] = "Test.p";
static const char test98_Test__s__1[] = "\nIn foo()\n";
static const char test98_Test__s__0[] = "Cls";
static const char test98_Test__s__3[] = "Test";
static const char test98_Test__s__2[] = "arrClsTarg";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test98_Test_pollen__run__E() {
     exit(0) ;

}

void test98_Test_foo__E( test98_Test_Cls  arr[], string n ) {
    test98_Test_pollen__printStr((string)test98_Test__s__1);
}

test98_Test_Cls_ test98_Test_Cls_new___E( test98_Test_Cls_ this ) {
    return this;
}

void test98_Test_targetInit__I() {
    (test98_Test_arrClsTarg__A) = (test98_Test_arrClsTarg__A);
    (test98_Test_arrClsTarg__A) = (test98_Test_arrClsHost__A);
    (test98_Test_arrClsHost__A) = (test98_Test_arrClsTarg__A);
    (test98_Test_arrClsHost__A) = (test98_Test_arrClsHost__A);
    (test98_Test_arrClsTargNoDim__V) = (test98_Test_arrClsHost__A);
    test98_Test_foo__E((test98_Test_arrClsTarg__A), test98_Test__s__2);
}

