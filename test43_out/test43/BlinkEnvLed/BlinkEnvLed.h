
/*
 * ======== imports ========
 */

#ifndef atmel_atmega8_Core__M
#define atmel_atmega8_Core__M
#include "../../atmel.atmega8/Core/Core.h"
#endif

#ifndef atmel_atmega8_PB5__M
#define atmel_atmega8_PB5__M
#include "../../atmel.atmega8/PB5/PB5.h"
#endif

#ifndef pollen_hardware_Led__M
#define pollen_hardware_Led__M
#include "../../pollen.hardware/Led/Led.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test43_BlinkEnvLed_pollen__ready__E();
void test43_BlinkEnvLed_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test43_BlinkEnvLed_ test43_BlinkEnvLed;

/*
 * ======== struct module definition (unit BlinkEnvLed) ========
 */

struct test43_BlinkEnvLed_ {
};
typedef struct test43_BlinkEnvLed_ test43_BlinkEnvLed_;

/*
 * ======== function members (unit BlinkEnvLed) ========
 */

extern void test43_BlinkEnvLed_pollen__reset__E();
extern void test43_BlinkEnvLed_pollen__run__E();
extern void test43_BlinkEnvLed_targetInit__I();


/*
 * ======== data members (unit BlinkEnvLed) ========
 */

