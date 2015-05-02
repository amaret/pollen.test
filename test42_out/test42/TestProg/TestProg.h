
/*
 * ======== imports ========
 */

#ifndef test42_TestMod__M
#define test42_TestMod__M
#include "../../test42/TestMod/TestMod.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test42_TestProg_pollen__reset__E();
void test42_TestProg_pollen__ready__E();
void test42_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test42_TestProg_ test42_TestProg;

/*
 * ======== struct module definition (unit TestProg) ========
 */

struct test42_TestProg_ {
};
typedef struct test42_TestProg_ test42_TestProg_;

/*
 * ======== function members (unit TestProg) ========
 */

extern void test42_TestProg_pollen__run__E();
extern void test42_TestProg_targetInit__I();


/*
 * ======== data members (unit TestProg) ========
 */

