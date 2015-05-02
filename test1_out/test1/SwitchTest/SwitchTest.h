
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test1_BlinkMilli_pollen__reset__E();
void test1_BlinkMilli_pollen__ready__E();
void test1_BlinkMilli_pollen__shutdown__E(uint8 i);

/*
 * ======== enum definitions (unit SwitchTest) ========
 */

typedef uint8 test1_SwitchTest_State;
#define test1_SwitchTest_State_UNINITIALIZED 0
#define test1_SwitchTest_State_INITIALIZATION 1
#define test1_SwitchTest_State_ACTIVE 2
#define test1_SwitchTest_State_IDLE 3
#define test1_SwitchTest_State_ERROR 4

/*
 * ======== extern definition ========
 */

extern struct test1_SwitchTest_ test1_SwitchTest;

/*
 * ======== struct module definition (unit SwitchTest) ========
 */

struct test1_SwitchTest_ {
};
typedef struct test1_SwitchTest_ test1_SwitchTest_;

/*
 * ======== function members (unit SwitchTest) ========
 */

extern uint8 test1_SwitchTest_switch_test__E( uint8 state );
extern void test1_SwitchTest_targetInit__I();


/*
 * ======== data members (unit SwitchTest) ========
 */

