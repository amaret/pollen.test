
/*
 * ======== string literals ========
 */

static const char test1_SwitchTest__s__fileName[] = "SwitchTest.p";
static const char test1_SwitchTest__s__0[] = "SwitchTest";

/*
 * ======== function definitions ========
 */

uint8 test1_SwitchTest_switch_test__E( uint8 state ) {
    uint8 nextState;
    nextState = (test1_SwitchTest_State_UNINITIALIZED);
    switch ((state)) {
    case (test1_SwitchTest_State_UNINITIALIZED):
        (nextState) = (test1_SwitchTest_State_INITIALIZATION);
        break;
    case (test1_SwitchTest_State_INITIALIZATION):
        (nextState) = (test1_SwitchTest_State_ACTIVE);
        break;
    case (test1_SwitchTest_State_IDLE):
    case (test1_SwitchTest_State_ACTIVE):
        (nextState) = (state);
        break;
    default:
        (nextState) = (test1_SwitchTest_State_ERROR);
        break;
    }
    return(  (nextState)  );
}

void test1_SwitchTest_targetInit__I() {
}

