
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

void test97_Test_pollen__reset__E();
void test97_Test_pollen__ready__E();
void test97_Test_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test97_Test_ test97_Test;

/*
 * ======== class definition (unit Test.Cls) ========
 */

struct test97_Test_Cls {
    uint8 i;
};
typedef struct test97_Test_Cls test97_Test_Cls;
typedef struct test97_Test_Cls* test97_Test_Cls_;

/*
 * ======== struct module definition (unit Test) ========
 */

struct test54_PrintImpl_;
struct test97_Test_ {
    test97_Test_Cls_ cls;
    test97_Test_Cls_ arrClsTarg[3];
    test97_Test_Cls_ * arrClsTargNoDim;
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test97_Test_ test97_Test_;

/*
 * ======== host variables (unit Test) ========
 */

typedef struct test97_Test_Cls test97_Test_host_cls__TYPE;
extern test97_Test_host_cls__TYPE test97_Test_host_cls__V;
typedef struct test97_Test_Cls test97_Test_host_cls2__TYPE;
extern test97_Test_host_cls2__TYPE test97_Test_host_cls2__V;
typedef struct test97_Test_Cls test97_Test_host_cls3__TYPE;
extern test97_Test_host_cls3__TYPE test97_Test_host_cls3__V;
typedef test97_Test_Cls test97_Test_arrClsHost__TYPE;
extern test97_Test_arrClsHost__TYPE test97_Test_arrClsHost__A[];

/*
 * ======== function members (unit Test) ========
 */

extern void test97_Test_bar__E();
extern void test97_Test_pollen__run__E();
extern void test97_Test_Cls_set_i__E( test97_Test_Cls_ this, uint8 j, string n );
extern void test97_Test_Cls_print_i__E( test97_Test_Cls_ this, string n );
extern test97_Test_Cls_ test97_Test_Cls_new___E( test97_Test_Cls_ this );
extern void test97_Test_targetInit__I();
extern void test97_Test_fun__E( test97_Test_Cls_ p );


/*
 * ======== data members (unit Test) ========
 */

#define test97_Test_cls__V test97_Test.cls
#define test97_Test_cls_i__V test97_Test.cls->i
#define test97_Test_cls_new_host__V test97_Test.cls->new_host
#define test97_Test_cls_print_i__V test97_Test.cls->print_i
#define test97_Test_cls_set_i__V test97_Test.cls->set_i
#define test97_Test_cls_new___V test97_Test.cls->new_
#define test97_Test_host_cls__V test97_Test_host_cls
#define test97_Test_host_cls_i__V test97_Test_host_cls.i
#define test97_Test_host_cls_new_host__V test97_Test_host_cls.new_host
#define test97_Test_host_cls_print_i__V test97_Test_host_cls.print_i
#define test97_Test_host_cls_set_i__V test97_Test_host_cls.set_i
#define test97_Test_host_cls_new___V test97_Test_host_cls.new_
#define test97_Test_host_cls2__V test97_Test_host_cls2
#define test97_Test_host_cls2_i__V test97_Test_host_cls2.i
#define test97_Test_host_cls2_new_host__V test97_Test_host_cls2.new_host
#define test97_Test_host_cls2_print_i__V test97_Test_host_cls2.print_i
#define test97_Test_host_cls2_set_i__V test97_Test_host_cls2.set_i
#define test97_Test_host_cls2_new___V test97_Test_host_cls2.new_
#define test97_Test_host_cls3__V test97_Test_host_cls3
#define test97_Test_host_cls3_i__V test97_Test_host_cls3.i
#define test97_Test_host_cls3_new_host__V test97_Test_host_cls3.new_host
#define test97_Test_host_cls3_print_i__V test97_Test_host_cls3.print_i
#define test97_Test_host_cls3_set_i__V test97_Test_host_cls3.set_i
#define test97_Test_host_cls3_new___V test97_Test_host_cls3.new_
#define test97_Test_arrClsTarg__A test97_Test.arrClsTarg
#define test97_Test_arrClsTarg_i__A test97_Test.arrClsTarg->i
#define test97_Test_arrClsTarg_new_host__A test97_Test.arrClsTarg->new_host
#define test97_Test_arrClsTarg_print_i__A test97_Test.arrClsTarg->print_i
#define test97_Test_arrClsTarg_set_i__A test97_Test.arrClsTarg->set_i
#define test97_Test_arrClsTarg_new___A test97_Test.arrClsTarg->new_
#define test97_Test_arrClsTargNoDim__V test97_Test.arrClsTargNoDim
#define test97_Test_arrClsTargNoDim_i__V test97_Test.arrClsTargNoDim->i
#define test97_Test_arrClsTargNoDim_new_host__V test97_Test.arrClsTargNoDim->new_host
#define test97_Test_arrClsTargNoDim_print_i__V test97_Test.arrClsTargNoDim->print_i
#define test97_Test_arrClsTargNoDim_set_i__V test97_Test.arrClsTargNoDim->set_i
#define test97_Test_arrClsTargNoDim_new___V test97_Test.arrClsTargNoDim->new_
#define test97_Test_pollenPrintProxy__V test97_Test.pollenPrintProxy
