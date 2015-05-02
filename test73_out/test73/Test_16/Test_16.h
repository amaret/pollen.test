
/*
 * ======== imports ========
 */

#ifndef virtual_mcu_GlobalInterrupts__M
#define virtual_mcu_GlobalInterrupts__M
#include "../../virtual.mcu/GlobalInterrupts/GlobalInterrupts.h"
#endif

#ifndef virtual_mcu_ConsolePrint__M
#define virtual_mcu_ConsolePrint__M
#include "../../virtual.mcu/ConsolePrint/ConsolePrint.h"
#endif

#ifndef pollen_event_Newsroom__M
#define pollen_event_Newsroom__M
#include "../../pollen.event/Newsroom/Newsroom.h"
#endif

#ifndef pollen_event_Event__M
#define pollen_event_Event__M
#include "../../pollen.event/Event/Event.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test73_Test_16_pollen__reset__E();
void test73_Test_16_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test73_Test_16_ test73_Test_16;

/*
 * ======== struct module definition (unit Test_16) ========
 */

struct pollen_event_Event;
struct test73_Test_16_ {
};
typedef struct test73_Test_16_ test73_Test_16_;

/*
 * ======== host variables (unit Test_16) ========
 */

typedef struct pollen_event_Event test73_Test_16_e1__TYPE;
extern test73_Test_16_e1__TYPE test73_Test_16_e1__V;
typedef struct pollen_event_Event test73_Test_16_e2__TYPE;
extern test73_Test_16_e2__TYPE test73_Test_16_e2__V;

/*
 * ======== function members (unit Test_16) ========
 */

extern void test73_Test_16_pollen__run__E();
extern void test73_Test_16_tick2__I();
extern void test73_Test_16_tick1__I();
extern void test73_Test_16_pollen__shutdown__E( uint8 id );
extern void test73_Test_16_targetInit__I();


/*
 * ======== data members (unit Test_16) ========
 */

#define test73_Test_16_e1__V test73_Test_16_e1
#define test73_Test_16_e2__V test73_Test_16_e2
