
/*
 * ======== imports ========
 */

#ifndef test82_ArrayReturnErr__M
#define test82_ArrayReturnErr__M
#include "../../test82/ArrayReturnErr/ArrayReturnErr.h"
#endif

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test82_TestProg_pollen__reset__E();
void test82_TestProg_pollen__ready__E();
void test82_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test82_TestProg_ test82_TestProg;

/*
 * ======== struct module definition (unit TestProg) ========
 */

struct test61_PrintImpl_;
struct test82_TestProg_ {
    struct test61_PrintImpl_ *pollenPrintProxy;
};
typedef struct test82_TestProg_ test82_TestProg_;

/*
 * ======== function members (unit TestProg) ========
 */

extern void test82_TestProg_pollen__run__E();
extern void test82_TestProg_targetInit__I();


/*
 * ======== data members (unit TestProg) ========
 */

#define test82_TestProg_pollenPrintProxy__V test82_TestProg.pollenPrintProxy
