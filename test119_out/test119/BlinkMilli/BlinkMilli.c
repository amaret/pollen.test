
/*
 * ======== string literals ========
 */

static const char test119_BlinkMilli__s__fileName[] = "BlinkMilli.p";
static const char test119_BlinkMilli__s__0[] = "local arr at idx 2 is ";
static const char test119_BlinkMilli__s__4[] = "BlinkMilli";
static const char test119_BlinkMilli__s__3[] = "host module arr at idx 2 is ";
static const char test119_BlinkMilli__s__1[] = "\n";
static const char test119_BlinkMilli__s__2[] = "module arr at idx 2 is ";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test119_BlinkMilli_test__I() {
    test119_BlinkMilli_pollen__printStr((string)test119_BlinkMilli__s__2);
	test119_BlinkMilli_pollen__printUint((uint32)(test119_BlinkMilli_nonhostarr__A[2]));
	test119_BlinkMilli_pollen__printStr((string)test119_BlinkMilli__s__1);
    test119_BlinkMilli_pollen__printStr((string)test119_BlinkMilli__s__3);
	test119_BlinkMilli_pollen__printUint((uint32)(test119_BlinkMilli_hostarr__A[2]));
	test119_BlinkMilli_pollen__printStr((string)test119_BlinkMilli__s__1);
}

void test119_BlinkMilli_pollen__run__E() {
    test119_BlinkMilli_test__I();
     exit(0) ;

}

void test119_BlinkMilli_targetInit__I() {
}

