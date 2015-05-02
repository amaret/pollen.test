
/*
 * ======== imports ========
 */

#ifndef test81_ArrayReturn__M
#define test81_ArrayReturn__M
#include "../../test81/ArrayReturn/ArrayReturn.h"
#endif

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test81_TestProg_pollen__reset__E();
void test81_TestProg_pollen__ready__E();
void test81_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test81_TestProg_ test81_TestProg;

/*
 * ======== struct module definition (unit TestProg) ========
 */

struct test61_PrintImpl_;
struct test81_TestProg_ {
    struct test61_PrintImpl_ *pollenPrintProxy;
};
typedef struct test81_TestProg_ test81_TestProg_;

/*
 * ======== function members (unit TestProg) ========
 */

extern void test81_TestProg_pollen__run__E();
extern void test81_TestProg_targetInit__I();


/*
 * ======== data members (unit TestProg) ========
 */

#define test81_TestProg_pollenPrintProxy__V test81_TestProg.pollenPrintProxy
