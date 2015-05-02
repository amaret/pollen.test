
/*
 * ======== string literals ========
 */

static const char localhost_Lifecycle__s__fileName[] = "Lifecycle.p";
static const char localhost_Lifecycle__s__2[] = "[SHUTDOWN]\n";
static const char localhost_Lifecycle__s__1[] = "[READY]\n";
static const char localhost_Lifecycle__s__3[] = "Lifecycle";
static const char localhost_Lifecycle__s__0[] = "[RESET]\n";

/*
 * ======== function definitions ========
 */

void localhost_Lifecycle_pollen__reset__E() {
    test90_Test_03_pollen__printStr((string)localhost_Lifecycle__s__0);
    local_mcu_Cpu_reset__E();
}

void localhost_Lifecycle_pollen__ready__E() {
    test90_Test_03_pollen__printStr((string)localhost_Lifecycle__s__1);
}

void localhost_Lifecycle_pollen__shutdown__E( uint8 id ) {
    local_mcu_Cpu_shutdown__E();
    test90_Test_03_pollen__printStr((string)localhost_Lifecycle__s__2);
}

void localhost_Lifecycle_targetInit__I() {
}

