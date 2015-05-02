
/*
 * ======== imports ========
 */

#ifndef amaret_local_Mcu__M
#define amaret_local_Mcu__M
#include "../../amaret.local/Mcu/Mcu.h"
#endif

#ifndef amaret_local_A1__M
#define amaret_local_A1__M
#include "../../amaret.local/A1/A1.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test33_Blink1_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test33_Blink1_ test33_Blink1;

/*
 * ======== struct module definition (unit Blink1) ========
 */

struct test33_Blink1_ {
};
typedef struct test33_Blink1_ test33_Blink1_;

/*
 * ======== function members (unit Blink1) ========
 */

extern void test33_Blink1_pollen__reset__E();
extern void test33_Blink1_pollen__run__E();
extern void test33_Blink1_pollen__shutdown__E( uint8 id );
extern void test33_Blink1_targetInit__I();


/*
 * ======== data members (unit Blink1) ========
 */

