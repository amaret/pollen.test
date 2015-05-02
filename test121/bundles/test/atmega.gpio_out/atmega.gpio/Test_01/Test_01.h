
/*
 * ======== imports ========
 */

#ifndef atmel_atmega_Cpu__M
#define atmel_atmega_Cpu__M
#include "../../atmel.atmega/Cpu/Cpu.h"
#endif

#ifndef atmel_atmega_PB4__M
#define atmel_atmega_PB4__M
#include "../../atmel.atmega/PB4/PB4.h"
#endif


/*
 * ======== imports ========
 */


/*
 * ======== imports ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void atmega_gpio_Test_01_pollen__reset__E();
void atmega_gpio_Test_01_pollen__shutdown__E(uint8 id);
void atmega_gpio_Test_01_pollen__wake__E(uint8 id);
void atmega_gpio_Test_01_pollen__hibernate__E(uint8 id);

/*
 * ======== extern definition ========
 */

extern struct atmega_gpio_Test_01_ atmega_gpio_Test_01;

/*
 * ======== struct module definition (unit Test_01) ========
 */

struct test54_PrintImpl_;
struct atmega_gpio_Test_01_ {
    struct test54_PrintImpl_ *intrinsicPrintProtocol;
};
typedef struct atmega_gpio_Test_01_ atmega_gpio_Test_01_;

/*
 * ======== function members (unit Test_01) ========
 */

extern void atmega_gpio_Test_01_pollen__ready__E();
extern void atmega_gpio_Test_01_pollen__run__E();
extern void atmega_gpio_Test_01_targetInit__I();


/*
 * ======== data members (unit Test_01) ========
 */

#define atmega_gpio_Test_01_intrinsicPrintProtocol__V atmega_gpio_Test_01.intrinsicPrintProtocol
