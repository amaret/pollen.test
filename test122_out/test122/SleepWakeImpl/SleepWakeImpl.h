
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test122_TestProg_pollen__reset__E();
void test122_TestProg_pollen__ready__E();
void test122_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test122_SleepWakeImpl_ test122_SleepWakeImpl;

/*
 * ======== struct module definition (unit SleepWakeImpl) ========
 */

struct test122_SleepWakeImpl_ {
};
typedef struct test122_SleepWakeImpl_ test122_SleepWakeImpl_;

/*
 * ======== function members (unit SleepWakeImpl) ========
 */

extern void test122_SleepWakeImpl_sleep__E( uint8 mode );
extern void test122_SleepWakeImpl_wake__E();
extern void test122_SleepWakeImpl_targetInit__I();


/*
 * ======== data members (unit SleepWakeImpl) ========
 */

