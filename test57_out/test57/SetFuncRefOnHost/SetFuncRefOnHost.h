
/*
 * ======== imports ========
 */

#ifndef test57_ClsFuncRef__M
#define test57_ClsFuncRef__M
#include "../../test57/ClsFuncRef/ClsFuncRef.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test57_SetFuncRefOnHost_pollen__reset__E();
void test57_SetFuncRefOnHost_pollen__ready__E();

/*
 * ======== header injections ========
 */

 #include <stdlib.h> 

/*
 * ======== extern definition ========
 */

extern struct test57_SetFuncRefOnHost_ test57_SetFuncRefOnHost;

/*
 * ======== struct module definition (unit SetFuncRefOnHost) ========
 */

typedef void (*test57_SetFuncRefOnHost_HandlerP_handler)();
struct test57_ClsFuncRef;
struct test57_SetFuncRefOnHost_ {
    test57_SetFuncRefOnHost_HandlerP_handler myHandler1_Host;
    test57_SetFuncRefOnHost_HandlerP_handler myHandler2_Host;
    test57_SetFuncRefOnHost_HandlerP_handler myHandler3_Host;
    test57_SetFuncRefOnHost_HandlerP_handler myHandler4_Host;
    bool flag;
    test57_SetFuncRefOnHost_HandlerP_handler myHandler1_Targ;
    test57_SetFuncRefOnHost_HandlerP_handler myHandler2_Targ;
    test57_SetFuncRefOnHost_HandlerP_handler myHandler3_Targ;
    test57_SetFuncRefOnHost_HandlerP_handler myHandler4_Targ;
    bool flag2;
};
typedef struct test57_SetFuncRefOnHost_ test57_SetFuncRefOnHost_;

/*
 * ======== host variables (unit SetFuncRefOnHost) ========
 */

typedef struct test57_ClsFuncRef test57_SetFuncRefOnHost_clsFR__TYPE;
extern test57_SetFuncRefOnHost_clsFR__TYPE test57_SetFuncRefOnHost_clsFR__V;

/*
 * ======== function members (unit SetFuncRefOnHost) ========
 */

extern void test57_SetFuncRefOnHost_setTheFuncRefOnTarg1__I( test57_SetFuncRefOnHost_HandlerP_handler h );
extern void test57_SetFuncRefOnHost_setTheFuncRefOnTarg2__I( test57_SetFuncRefOnHost_HandlerP_handler h );
extern void test57_SetFuncRefOnHost_setTheFuncRefOnTarg3__I( test57_SetFuncRefOnHost_HandlerP_handler h );
extern void test57_SetFuncRefOnHost_setTheFuncRefOnTarg4__I( test57_SetFuncRefOnHost_HandlerP_handler h );
extern void test57_SetFuncRefOnHost_targetTheHandler__I();
extern void test57_SetFuncRefOnHost_pollen__shutdown__E( uint8 id );
extern void test57_SetFuncRefOnHost_pollen__run__E();
extern void test57_SetFuncRefOnHost_targetInit__I();


/*
 * ======== data members (unit SetFuncRefOnHost) ========
 */

#define test57_SetFuncRefOnHost_myHandler1_Host__V test57_SetFuncRefOnHost.myHandler1_Host
#define test57_SetFuncRefOnHost_myHandler2_Host__V test57_SetFuncRefOnHost.myHandler2_Host
#define test57_SetFuncRefOnHost_myHandler3_Host__V test57_SetFuncRefOnHost.myHandler3_Host
#define test57_SetFuncRefOnHost_myHandler4_Host__V test57_SetFuncRefOnHost.myHandler4_Host
#define test57_SetFuncRefOnHost_flag__V test57_SetFuncRefOnHost.flag
#define test57_SetFuncRefOnHost_myHandler1_Targ__V test57_SetFuncRefOnHost.myHandler1_Targ
#define test57_SetFuncRefOnHost_myHandler2_Targ__V test57_SetFuncRefOnHost.myHandler2_Targ
#define test57_SetFuncRefOnHost_myHandler3_Targ__V test57_SetFuncRefOnHost.myHandler3_Targ
#define test57_SetFuncRefOnHost_myHandler4_Targ__V test57_SetFuncRefOnHost.myHandler4_Targ
#define test57_SetFuncRefOnHost_flag2__V test57_SetFuncRefOnHost.flag2
#define test57_SetFuncRefOnHost_clsFR__V test57_SetFuncRefOnHost_clsFR
