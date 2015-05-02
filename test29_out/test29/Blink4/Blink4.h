
/*
 * ======== imports ========
 */

#ifndef test29_AvrPin__M
#define test29_AvrPin__M
#include "../../test29/AvrPin/AvrPin.h"
#endif

#ifndef test29_Led__M
#define test29_Led__M
#include "../../test29/Led/Led.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test29_Blink4_pollen__reset__E();
void test29_Blink4_pollen__ready__E();
void test29_Blink4_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test29_Blink4_ test29_Blink4;

/*
 * ======== struct module definition (unit Blink4) ========
 */

struct test29_Blink4_ {
};
typedef struct test29_Blink4_ test29_Blink4_;

/*
 * ======== function members (unit Blink4) ========
 */

extern void test29_Blink4_delay__I( uint16 ms );
extern void test29_Blink4_pollen__run__E();
extern void test29_Blink4_targetInit__I();


/*
 * ======== data members (unit Blink4) ========
 */

