
/*
 * ======== string literals ========
 */

static const char test80_HelloWorld__s__fileName[] = "HelloWorld.p";
static const char test80_HelloWorld__s__7[] = "host test2 case 2 failed \n";
static const char test80_HelloWorld__s__6[] = "host test2 case 2 passed \n";
static const char test80_HelloWorld__s__11[] = "targ test2 case 1 failed \n";
static const char test80_HelloWorld__s__10[] = "targ test2 case 1 passed \n";
static const char test80_HelloWorld__s__13[] = "targ test2 case 2 failed \n";
static const char test80_HelloWorld__s__3[] = "targ test 1 failed \n";
static const char test80_HelloWorld__s__14[] = "targ test2 case 3 passed \n";
static const char test80_HelloWorld__s__1[] = "host test 1 failed \n";
static const char test80_HelloWorld__s__5[] = "host test2 case 1 failed \n";
static const char test80_HelloWorld__s__4[] = "host test2 case 1 passed \n";
static const char test80_HelloWorld__s__9[] = "host test2 case 3 failed \n";
static const char test80_HelloWorld__s__15[] = "targ test2 case 3 failed \n";
static const char test80_HelloWorld__s__2[] = "targ test 1 passed \n";
static const char test80_HelloWorld__s__8[] = "host test2 case 3 passed \n";
static const char test80_HelloWorld__s__0[] = "host test 1 passed \n";
static const char test80_HelloWorld__s__16[] = "HelloWorld";
static const char test80_HelloWorld__s__12[] = "targ test2 case 2 passed \n";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test80_HelloWorld_targ_test__I( test80_HelloWorld_LocalEnum2 i ) {
    if ((i) == (test80_HelloWorld_LocalEnum2_FIRST2)) {
        test80_HelloWorld_pollen__printStr((string)test80_HelloWorld__s__2);
    }
    else {
        test80_HelloWorld_pollen__printStr((string)test80_HelloWorld__s__3);
    }
}

void test80_HelloWorld_pollen__run__E() {
    test80_HelloWorld_targ_test__I((test80_HelloWorld_LocalEnum2_FIRST2));
    test80_HelloWorld_targ_test2__I((test80_CompEnum_CEnum1_ACLK), (test80_ModEnum_ModEnum_Y2), (test80_ProtoEnum_PEnum1_ACLK));
     exit(0) ;

}

void test80_HelloWorld_targ_test2__I( test80_CompEnum_CEnum1 i, test80_ModEnum_ModEnum j, test80_ProtoEnum_PEnum1 k ) {
    if ((i) == (test80_CompEnum_CEnum1_ACLK)) {
        test80_HelloWorld_pollen__printStr((string)test80_HelloWorld__s__10);
    }
    else {
        test80_HelloWorld_pollen__printStr((string)test80_HelloWorld__s__11);
    }
    if ((j) == (test80_ModEnum_ModEnum_Y2)) {
        test80_HelloWorld_pollen__printStr((string)test80_HelloWorld__s__12);
    }
    else {
        test80_HelloWorld_pollen__printStr((string)test80_HelloWorld__s__13);
    }
    if ((k) == (test80_ProtoEnum_PEnum1_ACLK)) {
        test80_HelloWorld_pollen__printStr((string)test80_HelloWorld__s__14);
    }
    else {
        test80_HelloWorld_pollen__printStr((string)test80_HelloWorld__s__15);
    }
}

void test80_HelloWorld_targetInit__I() {
}

