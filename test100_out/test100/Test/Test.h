
/*
 * ======== imports ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test100_Test_pollen__reset__E();
void test100_Test_pollen__ready__E();
void test100_Test_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test100_Test_ test100_Test;

/*
 * ======== class definition (unit Test.Elem) ========
 */

struct test100_Test_Elem {
    uint32 el;
};
typedef struct test100_Test_Elem test100_Test_Elem;
typedef struct test100_Test_Elem* test100_Test_Elem_;
struct test100_Test_Cls {
    uint8 i;
    test100_Test_Elem localElemHost[3];
    test100_Test_Elem efld;
};
typedef struct test100_Test_Cls test100_Test_Cls;
typedef struct test100_Test_Cls* test100_Test_Cls_;

/*
 * ======== struct module definition (unit Test) ========
 */

struct test54_PrintImpl_;
struct test100_Test_ {
    test100_Test_Cls_ cls;
    test100_Test_Cls_ arrClsTarg[3];
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test100_Test_ test100_Test_;

/*
 * ======== host variables (unit Test) ========
 */

typedef test100_Test_Cls test100_Test_arrClsHost__TYPE;
extern test100_Test_arrClsHost__TYPE test100_Test_arrClsHost__A[];

/*
 * ======== function members (unit Test) ========
 */

extern void test100_Test_Cls_set_arr__E( test100_Test_Cls_ this, test100_Test_Cls  arr[], string n );
extern test100_Test_Cls_ test100_Test_Cls_bar__E( test100_Test_Cls_ this );
extern void test100_Test_pollen__run__E();
extern void test100_Test_foo__E( test100_Test_Cls  arr[], string n );
extern void test100_Test_Cls_set_i__E( test100_Test_Cls_ this, uint8 j, string n );
extern void test100_Test_Cls_print_i__E( test100_Test_Cls_ this, string n );
extern test100_Test_Elem_ test100_Test_Elem_new___E( test100_Test_Elem_ this );
extern test100_Test_Cls_ test100_Test_Cls_new___E( test100_Test_Cls_ this );
extern void test100_Test_targetInit__I();
extern test100_Test_Elem_  test100_Test_Cls_fun__E( test100_Test_Cls_ this );


/*
 * ======== data members (unit Test) ========
 */

#define test100_Test_cls__V test100_Test.cls
#define test100_Test_cls_i__V test100_Test.cls->i
#define test100_Test_cls_localElemHost__V test100_Test.cls->localElemHost
#define test100_Test_cls_efld__V test100_Test.cls->efld
#define test100_Test_cls_new_host__V test100_Test.cls->new_host
#define test100_Test_cls_print_i__V test100_Test.cls->print_i
#define test100_Test_cls_set_i__V test100_Test.cls->set_i
#define test100_Test_cls_set_arr__V test100_Test.cls->set_arr
#define test100_Test_cls_bar__V test100_Test.cls->bar
#define test100_Test_cls_fun__V test100_Test.cls->fun
#define test100_Test_cls_new___V test100_Test.cls->new_
#define test100_Test_arrClsTarg__A test100_Test.arrClsTarg
#define test100_Test_arrClsTarg_i__A test100_Test.arrClsTarg->i
#define test100_Test_arrClsTarg_localElemHost__A test100_Test.arrClsTarg->localElemHost
#define test100_Test_arrClsTarg_efld__A test100_Test.arrClsTarg->efld
#define test100_Test_arrClsTarg_new_host__A test100_Test.arrClsTarg->new_host
#define test100_Test_arrClsTarg_print_i__A test100_Test.arrClsTarg->print_i
#define test100_Test_arrClsTarg_set_i__A test100_Test.arrClsTarg->set_i
#define test100_Test_arrClsTarg_set_arr__A test100_Test.arrClsTarg->set_arr
#define test100_Test_arrClsTarg_bar__A test100_Test.arrClsTarg->bar
#define test100_Test_arrClsTarg_fun__A test100_Test.arrClsTarg->fun
#define test100_Test_arrClsTarg_new___A test100_Test.arrClsTarg->new_
#define test100_Test_pollenPrintProxy__V test100_Test.pollenPrintProxy
