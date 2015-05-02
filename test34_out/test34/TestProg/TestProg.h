
/*
 * ======== imports ========
 */

#ifndef test34_TestMod__M
#define test34_TestMod__M
#include "../../test34/TestMod/TestMod.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test34_TestProg_pollen__reset__E();
void test34_TestProg_pollen__ready__E();
void test34_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test34_TestProg_ test34_TestProg;

/*
 * ======== struct module definition (unit TestProg) ========
 */

struct test34_TestProg_ {
};
typedef struct test34_TestProg_ test34_TestProg_;

/*
 * ======== function members (unit TestProg) ========
 */

extern void test34_TestProg_pollen__run__E();
extern void test34_TestProg_targetInit__I();


/*
 * ======== data members (unit TestProg) ========
 */

