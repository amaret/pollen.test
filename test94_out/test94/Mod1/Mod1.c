
/*
 * ======== string literals ========
 */

static const char test94_Mod1__s__fileName[] = "Mod1.p";
static const char test94_Mod1__s__1[] = " is ";
static const char test94_Mod1__s__6[] = "Mod1";
static const char test94_Mod1__s__3[] = "floor() of ";
static const char test94_Mod1__s__5[] = "ceil() of ";
static const char test94_Mod1__s__0[] = "abs() of ";
static const char test94_Mod1__s__2[] = "\n";
static const char test94_Mod1__s__4[] = ", is ";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test94_Mod1_pollen__run__E() {
    int8 r8;
    int16 r16;
    int32 r32;
    r8 = pollen_math_Absolute_abs8__E((test94_Mod1_i8__V));
    test94_Mod1_pollen__printStr((string)test94_Mod1__s__0);
	test94_Mod1_pollen__printInt((int32)(test94_Mod1_i8__V));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__1);
	test94_Mod1_pollen__printInt((int32)(r8));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__2);
    r16 = pollen_math_Absolute_abs16__E((test94_Mod1_i16__V));
    test94_Mod1_pollen__printStr((string)test94_Mod1__s__0);
	test94_Mod1_pollen__printInt((int32)(test94_Mod1_i16__V));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__1);
	test94_Mod1_pollen__printInt((int32)(r16));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__2);
    r32 = pollen_math_Absolute_abs32__E((test94_Mod1_i32__V));
    test94_Mod1_pollen__printStr((string)test94_Mod1__s__0);
	test94_Mod1_pollen__printInt((int32)(test94_Mod1_i32__V));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__1);
	test94_Mod1_pollen__printInt((int32)(r32));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__2);
    test94_Mod1_pollen__printStr((string)test94_Mod1__s__3);
	test94_Mod1_pollen__printReal((float)(test94_Mod1_f1__V));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__4);
	test94_Mod1_pollen__printReal((float)pollen_math_FloorCeil_floor__E((test94_Mod1_f1__V)));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__2);
    test94_Mod1_pollen__printStr((string)test94_Mod1__s__3);
	test94_Mod1_pollen__printReal((float)(test94_Mod1_f2__V));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__4);
	test94_Mod1_pollen__printReal((float)pollen_math_FloorCeil_floor__E((test94_Mod1_f2__V)));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__2);
    test94_Mod1_pollen__printStr((string)test94_Mod1__s__3);
	test94_Mod1_pollen__printReal((float)(test94_Mod1_f3__V));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__4);
	test94_Mod1_pollen__printReal((float)pollen_math_FloorCeil_floor__E((test94_Mod1_f3__V)));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__2);
    test94_Mod1_pollen__printStr((string)test94_Mod1__s__3);
	test94_Mod1_pollen__printReal((float)(test94_Mod1_f4__V));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__4);
	test94_Mod1_pollen__printReal((float)pollen_math_FloorCeil_floor__E((test94_Mod1_f4__V)));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__2);
    test94_Mod1_pollen__printStr((string)test94_Mod1__s__5);
	test94_Mod1_pollen__printReal((float)(test94_Mod1_f1__V));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__4);
	test94_Mod1_pollen__printReal((float)pollen_math_FloorCeil_ceil__E((test94_Mod1_f1__V)));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__2);
    test94_Mod1_pollen__printStr((string)test94_Mod1__s__5);
	test94_Mod1_pollen__printReal((float)(test94_Mod1_f2__V));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__4);
	test94_Mod1_pollen__printReal((float)pollen_math_FloorCeil_ceil__E((test94_Mod1_f2__V)));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__2);
    test94_Mod1_pollen__printStr((string)test94_Mod1__s__5);
	test94_Mod1_pollen__printReal((float)(test94_Mod1_f3__V));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__4);
	test94_Mod1_pollen__printReal((float)pollen_math_FloorCeil_ceil__E((test94_Mod1_f3__V)));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__2);
    test94_Mod1_pollen__printStr((string)test94_Mod1__s__5);
	test94_Mod1_pollen__printReal((float)(test94_Mod1_f4__V));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__4);
	test94_Mod1_pollen__printReal((float)pollen_math_FloorCeil_ceil__E((test94_Mod1_f4__V)));
	test94_Mod1_pollen__printStr((string)test94_Mod1__s__2);
     exit(0) ;

}

void test94_Mod1_targetInit__I() {
}

