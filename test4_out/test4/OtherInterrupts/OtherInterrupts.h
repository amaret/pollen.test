
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

extern struct test4_OtherInterrupts_ test4_OtherInterrupts;

/*
 * ======== struct module definition (unit OtherInterrupts) ========
 */

struct test4_OtherInterrupts_ {
};
typedef struct test4_OtherInterrupts_ test4_OtherInterrupts_;

/*
 * ======== function members (unit OtherInterrupts) ========
 */

extern uint16 test4_OtherInterrupts_other_disable__E();
extern uint16 test4_OtherInterrupts_disable__E();
extern void test4_OtherInterrupts_enable__E();
extern void test4_OtherInterrupts_other_enable__E();
extern void test4_OtherInterrupts_targetInit__I();


/*
 * ======== data members (unit OtherInterrupts) ========
 */

