
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

#ifndef pollen_hardware_Led__M
#define pollen_hardware_Led__M
#include "../../pollen.hardware/Led/Led.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test32_Blink2_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test32_Blink2_ test32_Blink2;

/*
 * ======== struct module definition (unit Blink2) ========
 */

struct test32_Blink2_ {
};
typedef struct test32_Blink2_ test32_Blink2_;

/*
 * ======== function members (unit Blink2) ========
 */

extern void test32_Blink2_pollen__reset__E();
extern void test32_Blink2_pollen__run__E();
extern void test32_Blink2_pollen__shutdown__E( uint8 id );
extern void test32_Blink2_targetInit__I();


/*
 * ======== data members (unit Blink2) ========
 */

