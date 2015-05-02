
/*
 * ======== imports ========
 */

#ifndef test53_Mod1__M
#define test53_Mod1__M
#include "../../test53/Mod1/Mod1.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test53_TestProg_pollen__reset__E();
void test53_TestProg_pollen__ready__E();
void test53_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test53_TestProg_ test53_TestProg;

/*
 * ======== class definition (unit TestProg.Nest) ========
 */

struct test53_TestProg_Nest {
    uint8 arr1[12];
};
typedef struct test53_TestProg_Nest test53_TestProg_Nest;
typedef struct test53_TestProg_Nest* test53_TestProg_Nest_;

/*
 * ======== struct module definition (unit TestProg) ========
 */

struct test53_Mod1_;
struct test53_TestProg_ {
    bool myFlag2;
    struct test53_Mod1_ *m1;
    test53_TestProg_Nest_ n1;
    uint16 * arrChk;
    test53_TestProg_Nest_ n;
};
typedef struct test53_TestProg_ test53_TestProg_;

/*
 * ======== host variables (unit TestProg) ========
 */

typedef bool test53_TestProg_myFlag__TYPE;
extern const test53_TestProg_myFlag__TYPE test53_TestProg_myFlag__V;
typedef struct test53_TestProg_Nest test53_TestProg_n_host__TYPE;
extern test53_TestProg_n_host__TYPE test53_TestProg_n_host__V;
typedef uint8 test53_TestProg_arr1__TYPE;
extern const test53_TestProg_arr1__TYPE test53_TestProg_arr1__A[];

/*
 * ======== function members (unit TestProg) ========
 */

extern void test53_TestProg_fcnpeg__I( uint8  arr[] );
extern void test53_TestProg_pollen__run__E();
extern test53_TestProg_Nest_ test53_TestProg_Nest_new___E( test53_TestProg_Nest_ this );
extern void test53_TestProg_targetInit__I();


/*
 * ======== data members (unit TestProg) ========
 */

#define test53_TestProg_myFlag2__V test53_TestProg.myFlag2
#define test53_TestProg_m1__V test53_TestProg.m1
#define test53_TestProg_n_host__V test53_TestProg_n_host
#define test53_TestProg_n_host_arr1__V test53_TestProg_n_host.arr1
#define test53_TestProg_n_host_new_host__V test53_TestProg_n_host.new_host
#define test53_TestProg_n_host_new___V test53_TestProg_n_host.new_
#define test53_TestProg_n1__V test53_TestProg.n1
#define test53_TestProg_n1_arr1__V test53_TestProg.n1->arr1
#define test53_TestProg_n1_new_host__V test53_TestProg.n1->new_host
#define test53_TestProg_n1_new___V test53_TestProg.n1->new_
#define test53_TestProg_arrChk__V test53_TestProg.arrChk
#define test53_TestProg_n__V test53_TestProg.n
#define test53_TestProg_n_arr1__V test53_TestProg.n->arr1
#define test53_TestProg_n_new_host__V test53_TestProg.n->new_host
#define test53_TestProg_n_new___V test53_TestProg.n->new_
