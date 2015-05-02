
/*
 * ======== string literals ========
 */

static const char test3_PrintTest__s__fileName[] = "PrintTest.p";
static const char test3_PrintTest__s__1[] = "chk";
static const char test3_PrintTest__s__2[] = "PrintTest";
static const char test3_PrintTest__s__0[] = "Hello World!";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 

/*
 * ======== function definitions ========
 */

void test3_PrintTest_forTest2__I() {
    for (;;) {
        test3_PrintTest_printStr__I(test3_PrintTest__s__0);
    }
}

void test3_PrintTest_pollen__run__E() {
    test3_PrintTest_pollen__assert__E((test3_PrintTest_f1__V) == 3, test3_PrintTest__s__1);
    test3_PrintTest_printStr__I(test3_PrintTest__s__0);
}

void test3_PrintTest_otherTest__I() {
    int32 z;
    int32 w;
    int32 p;
    
    (z) = (w) = 3;
    (z) = (w) = (p) = 3;
    (z) = (w) = (p) = (z) = 3;
    (z) = 3;
    (test3_PrintTest_f1__V) = (test3_PrintTest_f2__V) = (test3_PrintTest_f3__V) = 3;
    (z) = 3 * 5 + (test3_PrintTest_f1__V);
    test3_PrintTest_printStr__I((test3_PrintTest_pollen__unitname__V));
}

void test3_PrintTest_forTest__I() {
    uint32 i;
    for ((i) = 0; (i) < 10; (i)++) {
        test3_PrintTest_printStr__I(test3_PrintTest__s__0);
    }
}

void test3_PrintTest_targetInit__I() {
}

void test3_PrintTest_printStr__I( string str ) {
    test3_PrintTest_pollen__reset__E();
     printf("Str %s", str) ;

}

