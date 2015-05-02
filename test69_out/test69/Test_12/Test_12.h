
/*
 * ======== imports ========
 */

#ifndef pollen_event_Events__M
#define pollen_event_Events__M
#include "../../pollen.event/Events/Events.h"
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

void test69_Test_12_pollen__reset__E();
void test69_Test_12_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test69_Test_12_ test69_Test_12;

/*
 * ======== struct module definition (unit Test_12) ========
 */

struct test54_PrintImpl_;
struct test69_Test_12_ {
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test69_Test_12_ test69_Test_12_;

/*
 * ======== host variables (unit Test_12) ========
 */

typedef struct pollen_event_Events_Event test69_Test_12_e__TYPE;
extern test69_Test_12_e__TYPE test69_Test_12_e__V;

/*
 * ======== function members (unit Test_12) ========
 */

extern void test69_Test_12_pollen__run__E();
extern void test69_Test_12_tick__I();
extern void test69_Test_12_pollen__shutdown__E( uint8 id );
extern void test69_Test_12_targetInit__I();


/*
 * ======== data members (unit Test_12) ========
 */

#define test69_Test_12_e__V test69_Test_12_e
#define test69_Test_12_pollenPrintProxy__V test69_Test_12.pollenPrintProxy
