
/*
 * ======== imports ========
 */

#ifndef test75_Cls1__M
#define test75_Cls1__M
#include "../../test75/Cls1/Cls1.h"
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

extern struct test75_TestFcnRtn_ test75_TestFcnRtn;

/*
 * ======== struct module definition (unit TestFcnRtn) ========
 */

struct test75_Cls1;
struct test75_TestFcnRtn_ {
    struct test75_Cls1*  c2;
    uint8 r1;
    bool r2;
};
typedef struct test75_TestFcnRtn_ test75_TestFcnRtn_;

/*
 * ======== host variables (unit TestFcnRtn) ========
 */

typedef struct test75_Cls1 test75_TestFcnRtn_c1__TYPE;
extern test75_TestFcnRtn_c1__TYPE test75_TestFcnRtn_c1__V;

/*
 * ======== function members (unit TestFcnRtn) ========
 */

extern void test75_TestFcnRtn_foo__E();
extern void test75_TestFcnRtn_targetInit__I();


/*
 * ======== data members (unit TestFcnRtn) ========
 */

#define test75_TestFcnRtn_c1__V test75_TestFcnRtn_c1
#define test75_TestFcnRtn_c2__V test75_TestFcnRtn.c2
#define test75_TestFcnRtn_r1__V test75_TestFcnRtn.r1
#define test75_TestFcnRtn_r2__V test75_TestFcnRtn.r2
