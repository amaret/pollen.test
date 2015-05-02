
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test18_TestImporExport_pollen__reset__E();
void test18_TestImporExport_pollen__ready__E();
void test18_TestImporExport_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test18_GlobalInterrupts_ test18_GlobalInterrupts;

/*
 * ======== struct module definition (unit GlobalInterrupts) ========
 */

struct test18_GlobalInterrupts_ {
};
typedef struct test18_GlobalInterrupts_ test18_GlobalInterrupts_;

/*
 * ======== function members (unit GlobalInterrupts) ========
 */

extern void test18_GlobalInterrupts_restore__E( uint16 key );
extern uint16 test18_GlobalInterrupts_disable__E();
extern void test18_GlobalInterrupts_enable__E();
extern void test18_GlobalInterrupts_targetInit__I();


/*
 * ======== data members (unit GlobalInterrupts) ========
 */

