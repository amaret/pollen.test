
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

void test98_Test_pollen__reset__E();
void test98_Test_pollen__ready__E();
void test98_Test_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test98_Test_ test98_Test;

/*
 * ======== class definition (unit Test.Cls) ========
 */

struct test98_Test_Cls {
    uint8 i;
};
typedef struct test98_Test_Cls test98_Test_Cls;
typedef struct test98_Test_Cls* test98_Test_Cls_;

/*
 * ======== struct module definition (unit Test) ========
 */

struct test54_PrintImpl_;
struct test98_Test_ {
    test98_Test_Cls_ arrClsTarg[3];
    test98_Test_Cls_ * arrClsTargNoDim;
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test98_Test_ test98_Test_;

/*
 * ======== host variables (unit Test) ========
 */

typedef test98_Test_Cls test98_Test_arrClsHost__TYPE;
extern test98_Test_arrClsHost__TYPE test98_Test_arrClsHost__A[];
typedef test98_Test_Cls test98_Test_arrClsHostNoDim__TYPE;
extern test98_Test_arrClsHostNoDim__TYPE test98_Test_arrClsHostNoDim__V[];

/*
 * ======== function members (unit Test) ========
 */

extern void test98_Test_pollen__run__E();
extern void test98_Test_foo__E( test98_Test_Cls  arr[], string n );
extern test98_Test_Cls_ test98_Test_Cls_new___E( test98_Test_Cls_ this );
extern void test98_Test_targetInit__I();


/*
 * ======== data members (unit Test) ========
 */

#define test98_Test_arrClsTarg__A test98_Test.arrClsTarg
#define test98_Test_arrClsTarg_i__A test98_Test.arrClsTarg->i
#define test98_Test_arrClsTarg_new_host__A test98_Test.arrClsTarg->new_host
#define test98_Test_arrClsTarg_new___A test98_Test.arrClsTarg->new_
#define test98_Test_arrClsTargNoDim__V test98_Test.arrClsTargNoDim
#define test98_Test_arrClsTargNoDim_i__V test98_Test.arrClsTargNoDim->i
#define test98_Test_arrClsTargNoDim_new_host__V test98_Test.arrClsTargNoDim->new_host
#define test98_Test_arrClsTargNoDim_new___V test98_Test.arrClsTargNoDim->new_
#define test98_Test_pollenPrintProxy__V test98_Test.pollenPrintProxy
