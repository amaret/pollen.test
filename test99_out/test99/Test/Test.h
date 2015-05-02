
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

void test99_Test_pollen__reset__E();
void test99_Test_pollen__ready__E();
void test99_Test_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test99_Test_ test99_Test;

/*
 * ======== class definition (unit Test.Cls) ========
 */

struct test99_Test_Cls {
    uint8 i;
};
typedef struct test99_Test_Cls test99_Test_Cls;
typedef struct test99_Test_Cls* test99_Test_Cls_;

/*
 * ======== struct module definition (unit Test) ========
 */

struct test54_PrintImpl_;
struct test99_Test_ {
    test99_Test_Cls_ cls;
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test99_Test_ test99_Test_;

/*
 * ======== host variables (unit Test) ========
 */

typedef test99_Test_Cls test99_Test_arrClsHost__TYPE;
extern test99_Test_arrClsHost__TYPE test99_Test_arrClsHost__A[];

/*
 * ======== function members (unit Test) ========
 */

extern void test99_Test_pollen__run__E();
extern void test99_Test_foo__E( test99_Test_Cls  arr[], string n );
extern void test99_Test_Cls_set_i__E( test99_Test_Cls_ this, uint8 j, string n );
extern void test99_Test_Cls_print_i__E( test99_Test_Cls_ this, string n );
extern test99_Test_Cls_ test99_Test_Cls_new___E( test99_Test_Cls_ this );
extern void test99_Test_targetInit__I();


/*
 * ======== data members (unit Test) ========
 */

#define test99_Test_cls__V test99_Test.cls
#define test99_Test_cls_i__V test99_Test.cls->i
#define test99_Test_cls_new_host__V test99_Test.cls->new_host
#define test99_Test_cls_print_i__V test99_Test.cls->print_i
#define test99_Test_cls_set_i__V test99_Test.cls->set_i
#define test99_Test_cls_new___V test99_Test.cls->new_
#define test99_Test_pollenPrintProxy__V test99_Test.pollenPrintProxy
