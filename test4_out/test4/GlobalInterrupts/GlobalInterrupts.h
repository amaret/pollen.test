
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test4_TestExports_pollen__reset__E();
void test4_TestExports_pollen__ready__E();
void test4_TestExports_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test4_GlobalInterrupts_ test4_GlobalInterrupts;

/*
 * ======== struct module definition (unit GlobalInterrupts) ========
 */

struct test4_GlobalInterrupts_ {
};
typedef struct test4_GlobalInterrupts_ test4_GlobalInterrupts_;

/*
 * ======== function members (unit GlobalInterrupts) ========
 */

extern uint16 test4_GlobalInterrupts_disable__E();
extern void test4_GlobalInterrupts_enable__E();
extern void test4_GlobalInterrupts_targetInit__I();


/*
 * ======== data members (unit GlobalInterrupts) ========
 */

