
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

extern struct test4_Core_ test4_Core;

/*
 * ======== struct module definition (unit Core) ========
 */

struct test4_Core_ {
    uint32 sysFreq;
};
typedef struct test4_Core_ test4_Core_;

/*
 * ======== host variables (unit Core) ========
 */

typedef uint8 test4_Core_nops__TYPE;
extern const test4_Core_nops__TYPE test4_Core_nops__V;

/*
 * ======== function members (unit Core) ========
 */

extern void test4_Core_wait__E( uint16 us );
extern uint32 test4_Core_getFrequency__E();
extern void test4_Core_reset__E();
extern void test4_Core_cycle__E();
extern void test4_Core_targetInit__I();
extern void test4_Core_shutdown__E();
extern void test4_Core_setFrequency__E( uint32 hz );


/*
 * ======== data members (unit Core) ========
 */

#define test4_Core_sysFreq__V test4_Core.sysFreq
