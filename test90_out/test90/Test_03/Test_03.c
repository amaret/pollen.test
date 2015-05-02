
/*
 * ======== string literals ========
 */

static const char test90_Test_03__s__fileName[] = "Test_03.p";
static const char test90_Test_03__s__0[] = "Done!\n";
static const char test90_Test_03__s__1[] = "Test_03";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test90_Test_03_pollen__run__E() {
    pollen_time_Timer_Timer_start__E(&(test90_Test_03_t1__V), 500);
    pollen_event_Newsroom_run__E();
}

void test90_Test_03_tick__I() {
    pollen_parts_Led0_toggle__E();
    (test90_Test_03_count__V)++;
    if ((test90_Test_03_count__V) > 10) {
        test90_Test_03_pollen__printStr((string)test90_Test_03__s__0);
         exit(0) ;

    }
}

void test90_Test_03_targetInit__I() {
}

