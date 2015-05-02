
/*
 * ======== imports ========
 */

#ifndef test117_ArrayReturn__M
#define test117_ArrayReturn__M
#include "../../test117/ArrayReturn/ArrayReturn.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test117_TestProg_pollen__reset__E();
void test117_TestProg_pollen__ready__E();
void test117_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test117_TestProg_ test117_TestProg;

/*
 * ======== struct module definition (unit TestProg) ========
 */

struct test54_PrintImpl_;
struct test117_TestProg_ {
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test117_TestProg_ test117_TestProg_;

/*
 * ======== function members (unit TestProg) ========
 */

extern void test117_TestProg_pollen__run__E();
extern void test117_TestProg_targetInit__I();


/*
 * ======== data members (unit TestProg) ========
 */

#define test117_TestProg_pollenPrintProxy__V test117_TestProg.pollenPrintProxy
