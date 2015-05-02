
/*
 * ======== imports ========
 */

#ifndef atmel_atmega328_Mcu__M
#define atmel_atmega328_Mcu__M
#include "../../atmel.atmega328/Mcu/Mcu.h"
#endif

#ifndef atmel_atmega328_PD0__M
#define atmel_atmega328_PD0__M
#include "../../atmel.atmega328/PD0/PD0.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test22_Blink3_pollen__ready__E();
void test22_Blink3_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test22_Blink3_ test22_Blink3;

/*
 * ======== struct module definition (unit Blink3) ========
 */

struct atmel_atmega328_PD0_;
struct test22_Blink3_ {
    struct atmel_atmega328_PD0_ *pin;
};
typedef struct test22_Blink3_ test22_Blink3_;

/*
 * ======== function members (unit Blink3) ========
 */

extern void test22_Blink3_pollen__reset__E();
extern void test22_Blink3_pollen__run__E();
extern void test22_Blink3_targetInit__I();
extern void test22_Blink3_delaySome__I();


/*
 * ======== data members (unit Blink3) ========
 */

#define test22_Blink3_pin__V test22_Blink3.pin
