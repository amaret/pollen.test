
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

extern struct test6_Led1_ test6_Led1;

/*
 * ======== struct module definition (unit Led1) ========
 */

struct test6_Led1_ {
    string pollen__unitname;
};
typedef struct test6_Led1_ test6_Led1_;

/*
 * ======== function members (unit Led1) ========
 */

extern void test6_Led1_targetInit__I();
extern void test6_Led1_on__E();


/*
 * ======== const definitions ========
 */

#define test6_Led1_isActiveLow (true)

/*
 * ======== data members (unit Led1) ========
 */

#define test6_Led1_pollen__unitname__V test6_Led1.pollen__unitname
