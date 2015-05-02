
/*
 * ======== imports ========
 */

#ifndef test7_Led__M
#define test7_Led__M
#include "../../test7/Led/Led.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test7_T_pollen__reset__E();
void test7_T_pollen__ready__E();
void test7_T_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test7_T_ test7_T;

/*
 * ======== struct module definition (unit T) ========
 */

struct test7_T_ {
};
typedef struct test7_T_ test7_T_;

/*
 * ======== function members (unit T) ========
 */

extern void test7_T_pollen__run__E();
extern void test7_T_targetInit__I();
extern bool test7_T_on__I();


/*
 * ======== data members (unit T) ========
 */

