
/*
 * ======== string literals ========
 */

static const char local_mcu_GlobalInterrupts__s__fileName[] = "GlobalInterrupts.p";
static const char local_mcu_GlobalInterrupts__s__1[] = "GlobalInterrupts not restored\n";
static const char local_mcu_GlobalInterrupts__s__2[] = "GlobalInterrupts";
static const char local_mcu_GlobalInterrupts__s__0[] = "GlobalInterrupts restored\n";

/*
 * ======== function definitions ========
 */

void local_mcu_GlobalInterrupts_restore__E( bool state ) {
    if ((state)) {
        test90_Test_03_pollen__printStr((string)local_mcu_GlobalInterrupts__s__0);
    }
    else {
        test90_Test_03_pollen__printStr((string)local_mcu_GlobalInterrupts__s__1);
    }
}

void local_mcu_GlobalInterrupts_enable__E() {
    (local_mcu_GlobalInterrupts_enabled__V) = true;
}

void local_mcu_GlobalInterrupts_disable__E() {
    (local_mcu_GlobalInterrupts_enabled__V) = false;
}

bool local_mcu_GlobalInterrupts_isEnabled__E() {
    return(  (local_mcu_GlobalInterrupts_enabled__V)  );
}

void local_mcu_GlobalInterrupts_targetInit__I() {
}

