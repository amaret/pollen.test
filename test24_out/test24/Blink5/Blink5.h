
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

void test24_Blink5_pollen__ready__E();
void test24_Blink5_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test24_Blink5_ test24_Blink5;

/*
 * ======== struct module definition (unit Blink5) ========
 */

struct atmel_atmega328_PD0_;
struct test24_Blink5_ {
    struct atmel_atmega328_PD0_ *pin;
};
typedef struct test24_Blink5_ test24_Blink5_;

/*
 * ======== function members (unit Blink5) ========
 */

extern void test24_Blink5_pollen__reset__E();
extern void test24_Blink5_pollen__run__E();
extern void test24_Blink5_targetInit__I();
extern void test24_Blink5_delaySome__I();


/*
 * ======== data members (unit Blink5) ========
 */

#define test24_Blink5_pin__V test24_Blink5.pin
