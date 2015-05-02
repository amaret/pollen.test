
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

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test121_Test_01_pollen__reset__E();
void test121_Test_01_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test121_Test_01_ test121_Test_01;

/*
 * ======== struct module definition (unit Test_01) ========
 */

struct test54_PrintImpl_;
struct test121_Test_01_ {
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test121_Test_01_ test121_Test_01_;

/*
 * ======== function members (unit Test_01) ========
 */

extern void test121_Test_01_pollen__run__E();
extern void test121_Test_01_pollen__ready__E();
extern void test121_Test_01_targetInit__I();


/*
 * ======== data members (unit Test_01) ========
 */

#define test121_Test_01_pollenPrintProxy__V test121_Test_01.pollenPrintProxy
