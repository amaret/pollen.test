
/*
 * ======== imports ========
 */

#ifndef test55_PrintImpl__M
#define test55_PrintImpl__M
#include "../../test55/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test55_TestProg_pollen__reset__E();
void test55_TestProg_pollen__ready__E();
void test55_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test55_TestProg_ test55_TestProg;

/*
 * ======== class definition (unit TestProg.Nest) ========
 */

struct test55_TestProg_Nest {
    uint8 nest_arr1[12];
};
typedef struct test55_TestProg_Nest test55_TestProg_Nest;
typedef struct test55_TestProg_Nest* test55_TestProg_Nest_;

/*
 * ======== struct module definition (unit TestProg) ========
 */

struct test55_PrintImpl_;
struct test55_TestProg_ {
    test55_TestProg_Nest_ n1;
    test55_TestProg_Nest_ n;
    const uint8 ALIGN_8BIT;
    const uint8 ALIGN_16BIT;
    const uint8 ALIGN_32BIT;
    struct test55_PrintImpl_ *pollenPrintProxy;
};
typedef struct test55_TestProg_ test55_TestProg_;

/*
 * ======== host variables (unit TestProg) ========
 */

typedef uint8 test55_TestProg_arr1__TYPE;
extern const test55_TestProg_arr1__TYPE test55_TestProg_arr1__A[];
typedef struct test55_TestProg_Nest test55_TestProg_n_host__TYPE;
extern test55_TestProg_n_host__TYPE test55_TestProg_n_host__V;

/*
 * ======== function members (unit TestProg) ========
 */

extern void test55_TestProg_pollen__run__E();
extern test55_TestProg_Nest_ test55_TestProg_Nest_new___E( test55_TestProg_Nest_ this );
extern void test55_TestProg_targetInit__I();


/*
 * ======== const definitions ========
 */

#define test55_TestProg_ALIGN_8BIT (1)
#define test55_TestProg_ALIGN_16BIT (2)
#define test55_TestProg_ALIGN_32BIT (4)

/*
 * ======== data members (unit TestProg) ========
 */

#define test55_TestProg_n_host__V test55_TestProg_n_host
#define test55_TestProg_n_host_nest_arr1__V test55_TestProg_n_host.nest_arr1
#define test55_TestProg_n_host_new_host__V test55_TestProg_n_host.new_host
#define test55_TestProg_n_host_new___V test55_TestProg_n_host.new_
#define test55_TestProg_n1__V test55_TestProg.n1
#define test55_TestProg_n1_nest_arr1__V test55_TestProg.n1->nest_arr1
#define test55_TestProg_n1_new_host__V test55_TestProg.n1->new_host
#define test55_TestProg_n1_new___V test55_TestProg.n1->new_
#define test55_TestProg_n__V test55_TestProg.n
#define test55_TestProg_n_nest_arr1__V test55_TestProg.n->nest_arr1
#define test55_TestProg_n_new_host__V test55_TestProg.n->new_host
#define test55_TestProg_n_new___V test55_TestProg.n->new_
#define test55_TestProg_ALIGN_8BIT__V test55_TestProg.ALIGN_8BIT
#define test55_TestProg_ALIGN_16BIT__V test55_TestProg.ALIGN_16BIT
#define test55_TestProg_ALIGN_32BIT__V test55_TestProg.ALIGN_32BIT
#define test55_TestProg_pollenPrintProxy__V test55_TestProg.pollenPrintProxy
