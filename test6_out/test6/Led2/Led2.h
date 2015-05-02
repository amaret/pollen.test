
/*
 * ======== imports ========
 */

#ifndef pollen_interfaces_Gpio__M
#define pollen_interfaces_Gpio__M
#include "../../pollen.interfaces/Gpio/Gpio.h"
#endif

#ifndef test6_Y__M
#define test6_Y__M
#include "../../test6/Y/Y.h"
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

extern struct test6_Led2_ test6_Led2;

/*
 * ======== struct module definition (unit Led2) ========
 */

struct test6_Led2_ {
    string pollen__unitname;
};
typedef struct test6_Led2_ test6_Led2_;

/*
 * ======== function members (unit Led2) ========
 */

extern void test6_Led2_targetInit__I();
extern void test6_Led2_on__E();


/*
 * ======== const definitions ========
 */

#define test6_Led2_isActiveLow (false)

/*
 * ======== data members (unit Led2) ========
 */

#define test6_Led2_pollen__unitname__V test6_Led2.pollen__unitname
