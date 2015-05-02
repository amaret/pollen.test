
/*
 * ======== imports ========
 */

#ifndef pollen_data_HandlerQueue__M
#define pollen_data_HandlerQueue__M
#include "../../pollen.data/HandlerQueue/HandlerQueue.h"
#endif

#ifndef virtual_mcu_ConsolePrint__M
#define virtual_mcu_ConsolePrint__M
#include "../../virtual.mcu/ConsolePrint/ConsolePrint.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test70_QueueBug_01_pollen__reset__E();
void test70_QueueBug_01_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test70_QueueBug_01_ test70_QueueBug_01;

/*
 * ======== struct module definition (unit QueueBug_01) ========
 */

typedef void (*test70_QueueBug_01_HP_handler)();
struct pollen_data_HandlerQueue;
struct test54_PrintImpl_;
struct test70_QueueBug_01_ {
    test70_QueueBug_01_HP_handler h;
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test70_QueueBug_01_ test70_QueueBug_01_;

/*
 * ======== host variables (unit QueueBug_01) ========
 */

typedef struct pollen_data_HandlerQueue test70_QueueBug_01_eventHandlers__TYPE;
extern test70_QueueBug_01_eventHandlers__TYPE test70_QueueBug_01_eventHandlers__V;

/*
 * ======== function members (unit QueueBug_01) ========
 */

extern void test70_QueueBug_01_tick4__I();
extern void test70_QueueBug_01_pollen__run__E();
extern void test70_QueueBug_01_tick3__I();
extern void test70_QueueBug_01_tick2__I();
extern void test70_QueueBug_01_tick1__I();
extern void test70_QueueBug_01_tick5__I();
extern void test70_QueueBug_01_pollen__shutdown__E( uint8 id );
extern void test70_QueueBug_01_targetInit__I();


/*
 * ======== data members (unit QueueBug_01) ========
 */

#define test70_QueueBug_01_eventHandlers__V test70_QueueBug_01_eventHandlers
#define test70_QueueBug_01_h__V test70_QueueBug_01.h
#define test70_QueueBug_01_pollenPrintProxy__V test70_QueueBug_01.pollenPrintProxy
