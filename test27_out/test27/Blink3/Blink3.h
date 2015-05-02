
/*
 * ======== imports ========
 */

#ifndef test27_AvrPin__M
#define test27_AvrPin__M
#include "../../test27/AvrPin/AvrPin.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test27_Blink3_pollen__reset__E();
void test27_Blink3_pollen__ready__E();
void test27_Blink3_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test27_Blink3_ test27_Blink3;

/*
 * ======== struct module definition (unit Blink3) ========
 */

struct test27_AvrPin_;
struct test27_Blink3_ {
    struct test27_AvrPin_ *pin;
};
typedef struct test27_Blink3_ test27_Blink3_;

/*
 * ======== function members (unit Blink3) ========
 */

extern void test27_Blink3_delay__I( uint16 ms );
extern void test27_Blink3_pollen__run__E();
extern void test27_Blink3_targetInit__I();


/*
 * ======== data members (unit Blink3) ========
 */

#define test27_Blink3_pin__V test27_Blink3.pin
