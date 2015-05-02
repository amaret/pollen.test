
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

void test96_Test_pollen__reset__E();
void test96_Test_pollen__ready__E();
void test96_Test_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test96_Test_ test96_Test;

/*
 * ======== class definition (unit Test.Cls) ========
 */

struct test96_Test_Cls {
    uint8 i;
};
typedef struct test96_Test_Cls test96_Test_Cls;
typedef struct test96_Test_Cls* test96_Test_Cls_;

/*
 * ======== struct module definition (unit Test) ========
 */

struct test54_PrintImpl_;
struct test96_Test_ {
    test96_Test_Cls_ cls;
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test96_Test_ test96_Test_;

/*
 * ======== host variables (unit Test) ========
 */

typedef struct test96_Test_Cls test96_Test_host_cls__TYPE;
extern test96_Test_host_cls__TYPE test96_Test_host_cls__V;
typedef struct test96_Test_Cls test96_Test_host_cls2__TYPE;
extern test96_Test_host_cls2__TYPE test96_Test_host_cls2__V;
typedef struct test96_Test_Cls test96_Test_host_cls3__TYPE;
extern test96_Test_host_cls3__TYPE test96_Test_host_cls3__V;

/*
 * ======== function members (unit Test) ========
 */

extern void test96_Test_bar__E( test96_Test_Cls_ p );
extern void test96_Test_pollen__run__E();
extern void test96_Test_foo__E( test96_Test_Cls_ p, string s );
extern void test96_Test_Cls_set_i__E( test96_Test_Cls_ this, uint8 j );
extern void test96_Test_Cls_print_i__E( test96_Test_Cls_ this, string n );
extern test96_Test_Cls_ test96_Test_Cls_new___E( test96_Test_Cls_ this );
extern void test96_Test_targetInit__I();
extern void test96_Test_fun__E( test96_Test_Cls_ p );


/*
 * ======== data members (unit Test) ========
 */

#define test96_Test_cls__V test96_Test.cls
#define test96_Test_cls_i__V test96_Test.cls->i
#define test96_Test_cls_new_host__V test96_Test.cls->new_host
#define test96_Test_cls_print_i__V test96_Test.cls->print_i
#define test96_Test_cls_set_i__V test96_Test.cls->set_i
#define test96_Test_cls_new___V test96_Test.cls->new_
#define test96_Test_host_cls__V test96_Test_host_cls
#define test96_Test_host_cls_i__V test96_Test_host_cls.i
#define test96_Test_host_cls_new_host__V test96_Test_host_cls.new_host
#define test96_Test_host_cls_print_i__V test96_Test_host_cls.print_i
#define test96_Test_host_cls_set_i__V test96_Test_host_cls.set_i
#define test96_Test_host_cls_new___V test96_Test_host_cls.new_
#define test96_Test_host_cls2__V test96_Test_host_cls2
#define test96_Test_host_cls2_i__V test96_Test_host_cls2.i
#define test96_Test_host_cls2_new_host__V test96_Test_host_cls2.new_host
#define test96_Test_host_cls2_print_i__V test96_Test_host_cls2.print_i
#define test96_Test_host_cls2_set_i__V test96_Test_host_cls2.set_i
#define test96_Test_host_cls2_new___V test96_Test_host_cls2.new_
#define test96_Test_host_cls3__V test96_Test_host_cls3
#define test96_Test_host_cls3_i__V test96_Test_host_cls3.i
#define test96_Test_host_cls3_new_host__V test96_Test_host_cls3.new_host
#define test96_Test_host_cls3_print_i__V test96_Test_host_cls3.print_i
#define test96_Test_host_cls3_set_i__V test96_Test_host_cls3.set_i
#define test96_Test_host_cls3_new___V test96_Test_host_cls3.new_
#define test96_Test_pollenPrintProxy__V test96_Test.pollenPrintProxy
