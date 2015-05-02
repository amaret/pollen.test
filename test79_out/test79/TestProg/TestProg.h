
/*
 * ======== imports ========
 */

#ifndef test79_Junk__M
#define test79_Junk__M
#include "../../test79/Junk/Junk.h"
#endif

#ifndef test79_PrintImpl__M
#define test79_PrintImpl__M
#include "../../test79/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test79_TestProg_pollen__reset__E();
void test79_TestProg_pollen__ready__E();
void test79_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test79_TestProg_ test79_TestProg;

/*
 * ======== class definition (unit TestProg.Nest) ========
 */

struct test79_TestProg_Nest {
    bool flag;
    uint32 aNum;
};
typedef struct test79_TestProg_Nest test79_TestProg_Nest;
typedef struct test79_TestProg_Nest* test79_TestProg_Nest_;

/*
 * ======== struct module definition (unit TestProg) ========
 */

struct test79_PrintImpl_;
struct test79_TestProg_ {
    string s1;
    uint8 u8;
    uint16 u16;
    uint32 u32;
    int8 i8;
    int16 i16;
    int32 i32;
    struct test79_PrintImpl_ *pollenPrintProxy;
};
typedef struct test79_TestProg_ test79_TestProg_;

/*
 * ======== host variables (unit TestProg) ========
 */

typedef struct test79_TestProg_Nest test79_TestProg_aNest__TYPE;
extern test79_TestProg_aNest__TYPE test79_TestProg_aNest__V;

/*
 * ======== function members (unit TestProg) ========
 */

extern uint8 test79_TestProg_getAge__I();
extern void test79_TestProg_pollen__run__E();
extern test79_TestProg_Nest_ test79_TestProg_foo__I();
extern test79_TestProg_Nest_ test79_TestProg_Nest_new___E( test79_TestProg_Nest_ this );
extern bool test79_TestProg_Nest_getFlag__I( test79_TestProg_Nest_ this );
extern void test79_TestProg_targetInit__I();


/*
 * ======== data members (unit TestProg) ========
 */

#define test79_TestProg_s1__V test79_TestProg.s1
#define test79_TestProg_u8__V test79_TestProg.u8
#define test79_TestProg_u16__V test79_TestProg.u16
#define test79_TestProg_u32__V test79_TestProg.u32
#define test79_TestProg_i8__V test79_TestProg.i8
#define test79_TestProg_i16__V test79_TestProg.i16
#define test79_TestProg_i32__V test79_TestProg.i32
#define test79_TestProg_aNest__V test79_TestProg_aNest
#define test79_TestProg_aNest_flag__V test79_TestProg_aNest.flag
#define test79_TestProg_aNest_aNum__V test79_TestProg_aNest.aNum
#define test79_TestProg_aNest_getFlag__V test79_TestProg_aNest.getFlag
#define test79_TestProg_aNest_new_host__V test79_TestProg_aNest.new_host
#define test79_TestProg_aNest_new___V test79_TestProg_aNest.new_
#define test79_TestProg_pollenPrintProxy__V test79_TestProg.pollenPrintProxy
