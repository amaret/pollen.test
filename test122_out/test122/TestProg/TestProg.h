
/*
 * ======== imports ========
 */

#ifndef test122_SleepWakeImpl__M
#define test122_SleepWakeImpl__M
#include "../../test122/SleepWakeImpl/SleepWakeImpl.h"
#endif

#ifndef test122_DynMemImpl__M
#define test122_DynMemImpl__M
#include "../../test122/DynMemImpl/DynMemImpl.h"
#endif

#ifndef test122_Module1__M
#define test122_Module1__M
#include "../../test122/Module1/Module1.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test122_TestProg_pollen__reset__E();
void test122_TestProg_pollen__ready__E();
void test122_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test122_TestProg_ test122_TestProg;

/*
 * ======== struct module definition (unit TestProg) ========
 */

struct test122_Module1_;
struct test54_PrintImpl_;
struct test122_SleepWakeImpl_;
struct test122_DynMemImpl_;
struct test122_TestProg_ {
    struct test122_Module1_ *proto1;
    struct test54_PrintImpl_ *pollenPrintProxy;
    struct test122_SleepWakeImpl_ *pollenSleepWakeProxy;
    struct test122_DynMemImpl_ *pollenDynamicMemoryProxy;
};
typedef struct test122_TestProg_ test122_TestProg_;

/*
 * ======== function members (unit TestProg) ========
 */

extern void test122_TestProg_bar__I();
extern void test122_TestProg_pollen__run__E();
extern void test122_TestProg_targetInit__I();


/*
 * ======== data members (unit TestProg) ========
 */

#define test122_TestProg_proto1__V test122_TestProg.proto1
#define test122_TestProg_pollenPrintProxy__V test122_TestProg.pollenPrintProxy
#define test122_TestProg_pollenSleepWakeProxy__V test122_TestProg.pollenSleepWakeProxy
#define test122_TestProg_pollenDynamicMemoryProxy__V test122_TestProg.pollenDynamicMemoryProxy
