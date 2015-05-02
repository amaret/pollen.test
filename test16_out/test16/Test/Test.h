
/*
 * ======== imports ========
 */

#ifndef test16_Mod__M
#define test16_Mod__M
#include "../../test16/Mod/Mod.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test16_Test_pollen__reset__E();
void test16_Test_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test16_Test_ test16_Test;

/*
 * ======== struct module definition (unit Test) ========
 */

struct test16_Test_ {
};
typedef struct test16_Test_ test16_Test_;

/*
 * ======== function members (unit Test) ========
 */

extern void test16_Test_pollen__run__E();
extern void test16_Test_pollen__shutdown__E( uint8 id );
extern void test16_Test_targetInit__I();


/*
 * ======== data members (unit Test) ========
 */

