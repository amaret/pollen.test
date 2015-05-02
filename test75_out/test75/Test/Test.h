
/*
 * ======== imports ========
 */

#ifndef test75_TestFcnRtn__M
#define test75_TestFcnRtn__M
#include "../../test75/TestFcnRtn/TestFcnRtn.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test75_Test_pollen__reset__E();
void test75_Test_pollen__ready__E();
void test75_Test_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test75_Test_ test75_Test;

/*
 * ======== struct module definition (unit Test) ========
 */

struct test54_PrintImpl_;
struct test75_Test_ {
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test75_Test_ test75_Test_;

/*
 * ======== function members (unit Test) ========
 */

extern void test75_Test_pollen__run__E();
extern void test75_Test_targetInit__I();


/*
 * ======== data members (unit Test) ========
 */

#define test75_Test_pollenPrintProxy__V test75_Test.pollenPrintProxy
