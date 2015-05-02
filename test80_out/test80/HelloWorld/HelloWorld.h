
/*
 * ======== imports ========
 */

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test80_HelloWorld_pollen__reset__E();
void test80_HelloWorld_pollen__ready__E();
void test80_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== enum definitions (unit HelloWorld) ========
 */

typedef uint8 test80_HelloWorld_LocalEnum1;
#define test80_HelloWorld_LocalEnum1_SCLK 2
#define test80_HelloWorld_LocalEnum1_ACLK 7
#define test80_HelloWorld_LocalEnum1_NEXT 8
#define test80_HelloWorld_LocalEnum1_LAST 9
typedef uint8 test80_HelloWorld_LocalEnum2;
#define test80_HelloWorld_LocalEnum2_FIRST2 0
#define test80_HelloWorld_LocalEnum2_NEXT2 1
#define test80_HelloWorld_LocalEnum2_LAST2 2

/*
 * ======== extern definition ========
 */

extern struct test80_HelloWorld_ test80_HelloWorld;

/*
 * ======== struct module definition (unit HelloWorld) ========
 */

struct test61_PrintImpl_;
struct test80_HelloWorld_ {
    test80_HelloWorld_LocalEnum1 x;
    struct test61_PrintImpl_ *pollenPrintProxy;
};
typedef struct test80_HelloWorld_ test80_HelloWorld_;

/*
 * ======== function members (unit HelloWorld) ========
 */

extern void test80_HelloWorld_targ_test__I( test80_HelloWorld_LocalEnum2 i );
extern void test80_HelloWorld_pollen__run__E();
struct test80_ModEnum_ModEnum;
extern void test80_HelloWorld_targ_test2__I( test80_CompEnum_CEnum1 i, test80_ModEnum_ModEnum j, test80_ProtoEnum_PEnum1 k );
extern void test80_HelloWorld_targetInit__I();


/*
 * ======== data members (unit HelloWorld) ========
 */

#define test80_HelloWorld_x__V test80_HelloWorld.x
#define test80_HelloWorld_pollenPrintProxy__V test80_HelloWorld.pollenPrintProxy
