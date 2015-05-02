
/*
 * ======== string literals ========
 */

static const char test61_Blink__s__fileName[] = "Blink.p";
static const char test61_Blink__s__0[] = "Blink";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test61_Blink_delay__I( uint16 ms ) {
    uint16 us;
    uint8 i;
    for (; (ms) > 0; --(ms)) {
        for (us = 1000; (us) > 0; --(us)) {
            for (i = 0; (i) < 5; (i)++) {
            }
        }
    }
}

void test61_Blink_pollen__run__E() {
    uint8 i;
    i = 0;
    while ((i)++ < 5) {
        test61_Led_toggle__E();
        test61_Blink_delay__I(500);
    }
     exit(0) ;

}

void test61_Blink_targetInit__I() {
    test61_Led_off__E();
}

