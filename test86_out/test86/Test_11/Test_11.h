
/*
 * ======== imports ========
 */

#ifndef pollen_event_Dispatcher__M
#define pollen_event_Dispatcher__M
#include "../../pollen.event/Dispatcher/Dispatcher.h"
#endif

#ifndef pollen_event_Event__M
#define pollen_event_Event__M
#include "../../pollen.event/Event/Event.h"
#endif

#ifndef virtual_mcu_ConsolePrint__M
#define virtual_mcu_ConsolePrint__M
#include "../../virtual.mcu/ConsolePrint/ConsolePrint.h"
#endif

#ifndef virtual_mcu_GlobalInterrupts__M
#define virtual_mcu_GlobalInterrupts__M
#include "../../virtual.mcu/GlobalInterrupts/GlobalInterrupts.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test86_Test_11_pollen__reset__E();
void test86_Test_11_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test86_Test_11_ test86_Test_11;

/*
 * ======== struct module definition (unit Test_11) ========
 */

struct pollen_event_Event;
struct test54_PrintImpl_;
struct test86_Test_11_ {
    const uint8 NumEvents;
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test86_Test_11_ test86_Test_11_;

/*
 * ======== host variables (unit Test_11) ========
 */

typedef pollen_event_Event test86_Test_11_events__TYPE;
extern test86_Test_11_events__TYPE test86_Test_11_events__A[];

/*
 * ======== function members (unit Test_11) ========
 */

extern void test86_Test_11_tick4__I();
extern void test86_Test_11_pollen__run__E();
extern void test86_Test_11_tick3__I();
extern void test86_Test_11_tick2__I();
extern void test86_Test_11_tick1__I();
extern void test86_Test_11_pollen__shutdown__E( uint8 id );
extern void test86_Test_11_tick5__I();
extern void test86_Test_11_targetInit__I();


/*
 * ======== const definitions ========
 */

#define test86_Test_11_NumEvents (5)

/*
 * ======== data members (unit Test_11) ========
 */

#define test86_Test_11_NumEvents__V test86_Test_11.NumEvents
#define test86_Test_11_pollenPrintProxy__V test86_Test_11.pollenPrintProxy
