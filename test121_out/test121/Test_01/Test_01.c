
/*
 * ======== string literals ========
 */

static const char test121_Test_01__s__fileName[] = "Test_01.p";
static const char test121_Test_01__s__0[] = "Test_01";

/*
 * ======== function definitions ========
 */

void test121_Test_01_pollen__run__E() {
    while (true) {
        atmel_atmega_PB4_set__E();
        atmel_atmega_Cpu_cycle__E();
        atmel_atmega_PB4_clear__E();
        atmel_atmega_Cpu_cycle__E();
    }
}

void test121_Test_01_pollen__ready__E() {
    atmel_atmega_PB4_clear__E();
    atmel_atmega_PB4_makeOutput__E();
}

void test121_Test_01_targetInit__I() {
}

