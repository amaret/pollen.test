
/*
 * ======== imports ========
 */

#ifndef pollen_data_HandlerQueue__M
#define pollen_data_HandlerQueue__M
#include "../../pollen.data/HandlerQueue/HandlerQueue.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test66_Test_08_pollen__reset__E();
void test66_Test_08_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test66_Test_08_ test66_Test_08;

/*
 * ======== struct module definition (unit Test_08) ========
 */

typedef void (*test66_Test_08_HP_handler)();
struct pollen_data_HandlerQueue;
struct test54_PrintImpl_;
struct test66_Test_08_ {
    test66_Test_08_HP_handler h;
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test66_Test_08_ test66_Test_08_;

/*
 * ======== host variables (unit Test_08) ========
 */

typedef struct pollen_data_HandlerQueue test66_Test_08_handlers__TYPE;
extern test66_Test_08_handlers__TYPE test66_Test_08_handlers__V;

/*
 * ======== function members (unit Test_08) ========
 */

extern void test66_Test_08_tick4__I();
extern void test66_Test_08_pollen__run__E();
extern void test66_Test_08_tick3__I();
extern void test66_Test_08_tick2__I();
extern void test66_Test_08_tick1__I();
extern void test66_Test_08_tick5__I();
extern void test66_Test_08_pollen__shutdown__E( uint8 id );
extern void test66_Test_08_targetInit__I();


/*
 * ======== data members (unit Test_08) ========
 */

#define test66_Test_08_handlers__V test66_Test_08_handlers
#define test66_Test_08_h__V test66_Test_08.h
#define test66_Test_08_pollenPrintProxy__V test66_Test_08.pollenPrintProxy
