
/*
 * ======== imports ========
 */

#ifndef test56_On1__M
#define test56_On1__M
#include "../../test56/On1/On1.h"
#endif

#ifndef test56_On2__M
#define test56_On2__M
#include "../../test56/On2/On2.h"
#endif

#ifndef test56_On3__M
#define test56_On3__M
#include "../../test56/On3/On3.h"
#endif

#ifndef test56_On4__M
#define test56_On4__M
#include "../../test56/On4/On4.h"
#endif

#ifndef test56_On5__M
#define test56_On5__M
#include "../../test56/On5/On5.h"
#endif

#ifndef test56_PrintImpl__M
#define test56_PrintImpl__M
#include "../../test56/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test56_TestProg_pollen__reset__E();
void test56_TestProg_pollen__ready__E();
void test56_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test56_TestProg_ test56_TestProg;

/*
 * ======== struct module definition (unit TestProg) ========
 */

typedef void (*test56_TestProg_On1_on)(uint8);
typedef void (*test56_TestProg_On1_on_0)();
typedef void (*test56_TestProg_On2_on)(uint8);
typedef void (*test56_TestProg_On3_on)(uint8);
typedef void (*test56_TestProg_OnP_on)(uint8);
typedef void (*test56_TestProg_On1_on_2_0)();
struct test56_PrintImpl_;
struct test56_TestProg_ {
    test56_TestProg_On1_on on1_fref;
    test56_TestProg_On1_on_0 on1_0_fref;
    test56_TestProg_On2_on on2_fref;
    test56_TestProg_On3_on on3_fref;
    test56_TestProg_On1_on_0 on1_0_hfref;
    test56_TestProg_OnP_on onP_targ_fref;
    test56_TestProg_OnP_on onP_host_fref;
    test56_TestProg_On3_on on3_host_fref;
    test56_TestProg_On1_on_2_0 on1_fref_2;
    test56_TestProg_On1_on_2_0 on1_fref_3;
    test56_TestProg_On1_on_0 on1_0_fref_4;
    test56_TestProg_On3_on on_functions[3];
    test56_TestProg_OnP_on on_functions_proto[3];
    test56_TestProg_On3_on on_function_by_name[4];
    struct test56_PrintImpl_ *pollenPrintProxy;
};
typedef struct test56_TestProg_ test56_TestProg_;

/*
 * ======== host variables (unit TestProg) ========
 */

typedef test56_TestProg_On3_on test56_TestProg_on_host_functions__TYPE;
extern const test56_TestProg_on_host_functions__TYPE test56_TestProg_on_host_functions__A[];

/*
 * ======== function members (unit TestProg) ========
 */

extern void test56_TestProg_pollen__run__E();
extern void test56_TestProg_targetInit__I();


/*
 * ======== data members (unit TestProg) ========
 */

#define test56_TestProg_on1_fref__V test56_TestProg.on1_fref
#define test56_TestProg_on1_0_fref__V test56_TestProg.on1_0_fref
#define test56_TestProg_on2_fref__V test56_TestProg.on2_fref
#define test56_TestProg_on3_fref__V test56_TestProg.on3_fref
#define test56_TestProg_on1_0_hfref__V test56_TestProg.on1_0_hfref
#define test56_TestProg_onP_targ_fref__V test56_TestProg.onP_targ_fref
#define test56_TestProg_onP_host_fref__V test56_TestProg.onP_host_fref
#define test56_TestProg_on3_host_fref__V test56_TestProg.on3_host_fref
#define test56_TestProg_on1_fref_2__V test56_TestProg.on1_fref_2
#define test56_TestProg_on1_fref_3__V test56_TestProg.on1_fref_3
#define test56_TestProg_on1_0_fref_4__V test56_TestProg.on1_0_fref_4
#define test56_TestProg_on_functions__A test56_TestProg.on_functions
#define test56_TestProg_on_functions_proto__A test56_TestProg.on_functions_proto
#define test56_TestProg_on_function_by_name__A test56_TestProg.on_function_by_name
#define test56_TestProg_pollenPrintProxy__V test56_TestProg.pollenPrintProxy
