
/*
 * ======== imports ========
 */

#ifndef test6_Y__M
#define test6_Y__M
#include "../../test6/Y/Y.h"
#endif

#ifndef test6_Led1__M
#define test6_Led1__M
#include "../../test6/Led1/Led1.h"
#endif

#ifndef test6_Led2__M
#define test6_Led2__M
#include "../../test6/Led2/Led2.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test6_T_pollen__reset__E();
void test6_T_pollen__ready__E();
void test6_T_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test6_T_ test6_T;

/*
 * ======== struct module definition (unit T) ========
 */

struct test6_T_ {
};
typedef struct test6_T_ test6_T_;

/*
 * ======== function members (unit T) ========
 */

extern void test6_T_pollen__run__E();
extern void test6_T_targetInit__I();
extern bool test6_T_on__I();


/*
 * ======== data members (unit T) ========
 */

