
/*
 * ======== imports ========
 */

#ifndef virtual_mcu_ConsolePrint__M
#define virtual_mcu_ConsolePrint__M
#include "../../virtual.mcu/ConsolePrint/ConsolePrint.h"
#endif

#ifndef pollen_event_Dispatcher__M
#define pollen_event_Dispatcher__M
#include "../../pollen.event/Dispatcher/Dispatcher.h"
#endif

#ifndef pollen_event_Event__M
#define pollen_event_Event__M
#include "../../pollen.event/Event/Event.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test72_Test_13_pollen__reset__E();
void test72_Test_13_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test72_Test_13_ test72_Test_13;

/*
 * ======== struct module definition (unit Test_13) ========
 */

struct pollen_event_Event;
struct test54_PrintImpl_;
struct test72_Test_13_ {
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test72_Test_13_ test72_Test_13_;

/*
 * ======== host variables (unit Test_13) ========
 */

typedef struct pollen_event_Event test72_Test_13_e__TYPE;
extern test72_Test_13_e__TYPE test72_Test_13_e__V;

/*
 * ======== function members (unit Test_13) ========
 */

extern void test72_Test_13_pollen__run__E();
extern void test72_Test_13_pollen__shutdown__E( uint8 id );
extern void test72_Test_13_tick__I();
extern void test72_Test_13_targetInit__I();


/*
 * ======== data members (unit Test_13) ========
 */

#define test72_Test_13_e__V test72_Test_13_e
#define test72_Test_13_pollenPrintProxy__V test72_Test_13.pollenPrintProxy
