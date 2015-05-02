
/*
 * ======== string literals ========
 */

static const char test77_Test_21__s__fileName[] = "Test_21.p";
static const char test77_Test_21__s__5[] = "Test_21";
static const char test77_Test_21__s__3[] = "Running!...\n";
static const char test77_Test_21__s__2[] = "TICK3!\n";
static const char test77_Test_21__s__4[] = "Shutdown!\n";
static const char test77_Test_21__s__0[] = "TICK1!\n";
static const char test77_Test_21__s__1[] = "TICK2!\n";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test77_Test_21_tick3__I() {
    test77_Test_21_pollen__printStr((string)test77_Test_21__s__2);
}

void test77_Test_21_pollen__run__E() {
    pollen_time_Timer_Timer_start__E(&(test77_Test_21_t1__V), 250, true);
    pollen_time_Timer_Timer_start__E(&(test77_Test_21_t2__V), 350, true);
    pollen_time_Timer_Timer_start__E(&(test77_Test_21_t3__V), 550, true);
    test77_Test_21_pollen__printStr((string)test77_Test_21__s__3);
    pollen_event_Newsroom_run__E();
    test77_Test_21_pollen__printStr((string)test77_Test_21__s__3);
    test77_Test_21_pollen__printStr((string)test77_Test_21__s__3);
    test77_Test_21_pollen__printStr((string)test77_Test_21__s__3);
    test77_Test_21_pollen__printStr((string)test77_Test_21__s__3);
    test77_Test_21_pollen__shutdown__E(0);
}

void test77_Test_21_tick2__I() {
    test77_Test_21_pollen__printStr((string)test77_Test_21__s__1);
}

void test77_Test_21_tick1__I() {
    test77_Test_21_pollen__printStr((string)test77_Test_21__s__0);
}

void test77_Test_21_pollen__shutdown__E( uint8 id ) {
    test77_Test_21_pollen__printStr((string)test77_Test_21__s__4);
     exit(0) ;

}

void test77_Test_21_targetInit__I() {
}

