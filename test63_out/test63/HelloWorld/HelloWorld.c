
/*
 * ======== string literals ========
 */

static const char test63_HelloWorld__s__fileName[] = "HelloWorld.p";
static const char test63_HelloWorld__s__14[] = "PASS CompEnum (target) \n";
static const char test63_HelloWorld__s__11[] = "FAIL LocalEnum2 (target) \n ";
static const char test63_HelloWorld__s__1[] = " ";
static const char test63_HelloWorld__s__9[] = "FAIL LocalEnum1 (target) \n ";
static const char test63_HelloWorld__s__12[] = "PASS ProtoEnum & ModEnum (target) \n";
static const char test63_HelloWorld__s__6[] = "PASS Comp, Proto, Mod enums (host) \n";
static const char test63_HelloWorld__s__0[] = "PASS LocalEnum1 (host) \n";
static const char test63_HelloWorld__s__8[] = "PASS LocalEnum1 (target) \n";
static const char test63_HelloWorld__s__15[] = "FAIL CompEnum (target) \n ";
static const char test63_HelloWorld__s__10[] = "PASS LocalEnum2 (target) \n";
static const char test63_HelloWorld__s__3[] = "FAIL LocalEnum1 (host) \n ";
static const char test63_HelloWorld__s__5[] = "FAIL LocalEnum2 (host) \n ";
static const char test63_HelloWorld__s__13[] = "FAIL ProtoEnum & ModEnum (target) \n ";
static const char test63_HelloWorld__s__2[] = "\n ";
static const char test63_HelloWorld__s__16[] = "HelloWorld";
static const char test63_HelloWorld__s__7[] = "FAIL Comp, Proto, Mod enums (host) \n";
static const char test63_HelloWorld__s__4[] = "PASS LocalEnum2 (host) \n";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test63_HelloWorld_targ_test__I() {
    uint8 x;
    uint8 y;
    uint8 z;
    uint8 z1;
    x = (test63_HelloWorld_LocalEnum1_SCLK);
    y = (test63_HelloWorld_LocalEnum1_ACLK);
    z = (test63_HelloWorld_LocalEnum1_NEXT);
    z1 = (test63_HelloWorld_LocalEnum1_LAST);
    if ((x) == 2 && (y) == 7 && (z) == 8 && (z1) == 9) {
        test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__8);
    }
    else {
        test63_HelloWorld_pollen__printUint((uint32)(x));
	test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__1);
	test63_HelloWorld_pollen__printUint((uint32)(y));
	test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__1);
	test63_HelloWorld_pollen__printUint((uint32)(z));
	test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__1);
	test63_HelloWorld_pollen__printUint((uint32)(z1));
	test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__2);
        test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__9);
    }
    (x) = (test63_HelloWorld_LocalEnum2_FIRST2);
    (y) = (test63_HelloWorld_LocalEnum2_NEXT2);
    (z) = (test63_HelloWorld_LocalEnum2_LAST2);
    if ((x) == 0 && (y) == 1 && (z) == 2) {
        test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__10);
    }
    else {
        test63_HelloWorld_pollen__printUint((uint32)(x));
	test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__1);
	test63_HelloWorld_pollen__printUint((uint32)(y));
	test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__1);
	test63_HelloWorld_pollen__printUint((uint32)(z));
	test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__2);
        test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__11);
    }
    (x) = (test63_ProtoEnum_PEnum1_NEXT);
    (y) = (test63_ProtoEnum_PEnum2_NEXT);
    (z) = (test63_ModEnum_ModEnum_Y2);
    if ((x) == 8 && (y) == 1 && (z) == 2) {
        test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__12);
    }
    else {
        test63_HelloWorld_pollen__printUint((uint32)(x));
	test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__1);
	test63_HelloWorld_pollen__printUint((uint32)(y));
	test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__1);
	test63_HelloWorld_pollen__printUint((uint32)(z));
	test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__2);
        test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__13);
    }
    (x) = (test63_CompEnum_CEnum1_NEXT);
    (y) = (test63_CompEnum_CEnum2_NEXT);
    if ((x) == 8 && (y) == 1) {
        test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__14);
    }
    else {
        test63_HelloWorld_pollen__printUint((uint32)(x));
	test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__1);
	test63_HelloWorld_pollen__printUint((uint32)(y));
	test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__2);
        test63_HelloWorld_pollen__printStr((string)test63_HelloWorld__s__15);
    }
}

void test63_HelloWorld_pollen__run__E() {
    test63_HelloWorld_targ_test__I();
     exit(0) ;

}

void test63_HelloWorld_targetInit__I() {
}

