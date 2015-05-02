
/*
 * ======== imports ========
 */

#ifndef test54_Junk__M
#define test54_Junk__M
#include "../../test54/Junk/Junk.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test54_TestProg_pollen__reset__E();
void test54_TestProg_pollen__ready__E();
void test54_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test54_TestProg_ test54_TestProg;

/*
 * ======== class definition (unit TestProg.Nest) ========
 */

struct test54_TestProg_Nest {
    bool flag;
    uint32 aNum;
};
typedef struct test54_TestProg_Nest test54_TestProg_Nest;
typedef struct test54_TestProg_Nest* test54_TestProg_Nest_;

/*
 * ======== struct module definition (unit TestProg) ========
 */

struct test54_PrintImpl_;
struct test54_TestProg_ {
    string s1;
    uint8 u8;
    uint16 u16;
    uint32 u32;
    int8 i8;
    int16 i16;
    int32 i32;
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test54_TestProg_ test54_TestProg_;

/*
 * ======== host variables (unit TestProg) ========
 */

typedef struct test54_TestProg_Nest test54_TestProg_aNest__TYPE;
extern test54_TestProg_aNest__TYPE test54_TestProg_aNest__V;

/*
 * ======== function members (unit TestProg) ========
 */

extern void test54_TestProg_pollen__run__E();
extern test54_TestProg_Nest_ test54_TestProg_Nest_new___E( test54_TestProg_Nest_ this );
extern bool test54_TestProg_Nest_getFlag__I( test54_TestProg_Nest_ this );
extern void test54_TestProg_targetInit__I();


/*
 * ======== data members (unit TestProg) ========
 */

#define test54_TestProg_s1__V test54_TestProg.s1
#define test54_TestProg_u8__V test54_TestProg.u8
#define test54_TestProg_u16__V test54_TestProg.u16
#define test54_TestProg_u32__V test54_TestProg.u32
#define test54_TestProg_i8__V test54_TestProg.i8
#define test54_TestProg_i16__V test54_TestProg.i16
#define test54_TestProg_i32__V test54_TestProg.i32
#define test54_TestProg_aNest__V test54_TestProg_aNest
#define test54_TestProg_aNest_flag__V test54_TestProg_aNest.flag
#define test54_TestProg_aNest_aNum__V test54_TestProg_aNest.aNum
#define test54_TestProg_aNest_getFlag__V test54_TestProg_aNest.getFlag
#define test54_TestProg_aNest_new_host__V test54_TestProg_aNest.new_host
#define test54_TestProg_aNest_new___V test54_TestProg_aNest.new_
#define test54_TestProg_pollenPrintProxy__V test54_TestProg.pollenPrintProxy
