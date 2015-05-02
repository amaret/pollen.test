
/*
 * ======== string literals ========
 */

static const char test19_BlinkMilli2__s__fileName[] = "BlinkMilli2.p";
static const char test19_BlinkMilli2__s__0[] = "In pollen.run()\n";
static const char test19_BlinkMilli2__s__1[] = "BlinkMilli2";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test19_BlinkMilli2_pollen__reset__E() {
}

void test19_BlinkMilli2_pollen__run__E() {
    test19_BlinkMilli2_pollen__printStr((string)test19_BlinkMilli2__s__0);
    pollen_interfaces_Led_toggle__E();
     exit(0) ;

}

void test19_BlinkMilli2_targetInit__I() {
}

