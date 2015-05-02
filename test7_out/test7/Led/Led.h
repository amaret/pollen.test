
/*
 * ======== imports ========
 */

#ifndef test7_Y__M
#define test7_Y__M
#include "../../test7/Y/Y.h"
#endif

#ifndef pollen_interfaces_Gpio__M
#define pollen_interfaces_Gpio__M
#include "../../pollen.interfaces/Gpio/Gpio.h"
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

extern struct test7_Led_ test7_Led;

/*
 * ======== struct module definition (unit Led) ========
 */

struct test7_Led_ {
};
typedef struct test7_Led_ test7_Led_;

/*
 * ======== function members (unit Led) ========
 */

extern void test7_Led_targetInit__I();
extern void test7_Led_on__E();


/*
 * ======== const definitions ========
 */

#define test7_Led_isActiveLow (3)
#define test7_Led_newNum (2)

/*
 * ======== data members (unit Led) ========
 */

