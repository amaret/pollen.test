
/*
 * ======== imports ========
 */

#ifndef test30_AvrPin__M
#define test30_AvrPin__M
#include "../../test30/AvrPin/AvrPin.h"
#endif

#ifndef test30_Led__M
#define test30_Led__M
#include "../../test30/Led/Led.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test30_Blink5_pollen__reset__E();
void test30_Blink5_pollen__ready__E();
void test30_Blink5_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test30_Blink5_ test30_Blink5;

/*
 * ======== struct module definition (unit Blink5) ========
 */

struct test30_Blink5_ {
};
typedef struct test30_Blink5_ test30_Blink5_;

/*
 * ======== function members (unit Blink5) ========
 */

extern void test30_Blink5_delay__I( uint16 ms );
extern void test30_Blink5_pollen__run__E();
extern void test30_Blink5_targetInit__I();


/*
 * ======== data members (unit Blink5) ========
 */

