
/*
 * ======== imports ========
 */

#ifndef test28_MspPin__M
#define test28_MspPin__M
#include "../../test28/MspPin/MspPin.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test28_Blink2_pollen__reset__E();
void test28_Blink2_pollen__ready__E();
void test28_Blink2_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test28_Blink2_ test28_Blink2;

/*
 * ======== struct module definition (unit Blink2) ========
 */

struct test28_Blink2_ {
};
typedef struct test28_Blink2_ test28_Blink2_;

/*
 * ======== function members (unit Blink2) ========
 */

extern void test28_Blink2_delay__I( uint16 ms );
extern void test28_Blink2_pollen__run__E();
extern void test28_Blink2_targetInit__I();


/*
 * ======== data members (unit Blink2) ========
 */

