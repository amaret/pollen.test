
/*
 * ======== imports ========
 */

#ifndef test4_GlobalInterrupts__M
#define test4_GlobalInterrupts__M
#include "../../test4/GlobalInterrupts/GlobalInterrupts.h"
#endif

#ifndef test4_OtherInterrupts__M
#define test4_OtherInterrupts__M
#include "../../test4/OtherInterrupts/OtherInterrupts.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test4_TestExports_pollen__reset__E();
void test4_TestExports_pollen__ready__E();
void test4_TestExports_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test4_TestExports_ test4_TestExports;

/*
 * ======== struct module definition (unit TestExports) ========
 */

struct test4_TestExports_ {
};
typedef struct test4_TestExports_ test4_TestExports_;

/*
 * ======== function members (unit TestExports) ========
 */

extern void test4_TestExports_pollen__run__E();
extern void test4_TestExports_enable__I();
extern void test4_TestExports_foo__I();
extern void test4_TestExports_targetInit__I();


/*
 * ======== data members (unit TestExports) ========
 */

