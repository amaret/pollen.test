
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

void test63_HelloWorld_pollen__reset__E();
void test63_HelloWorld_pollen__ready__E();
void test63_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== enum definitions (unit HelloWorld) ========
 */

typedef uint8 test63_HelloWorld_LocalEnum1;
#define test63_HelloWorld_LocalEnum1_SCLK 2
#define test63_HelloWorld_LocalEnum1_ACLK 7
#define test63_HelloWorld_LocalEnum1_NEXT 8
#define test63_HelloWorld_LocalEnum1_LAST 9
typedef uint8 test63_HelloWorld_LocalEnum2;
#define test63_HelloWorld_LocalEnum2_FIRST2 0
#define test63_HelloWorld_LocalEnum2_NEXT2 1
#define test63_HelloWorld_LocalEnum2_LAST2 2

/*
 * ======== extern definition ========
 */

extern struct test63_HelloWorld_ test63_HelloWorld;

/*
 * ======== struct module definition (unit HelloWorld) ========
 */

struct test61_PrintImpl_;
struct test63_HelloWorld_ {
    struct test61_PrintImpl_ *pollenPrintProxy;
};
typedef struct test63_HelloWorld_ test63_HelloWorld_;

/*
 * ======== function members (unit HelloWorld) ========
 */

extern void test63_HelloWorld_targ_test__I();
extern void test63_HelloWorld_pollen__run__E();
extern void test63_HelloWorld_targetInit__I();


/*
 * ======== data members (unit HelloWorld) ========
 */

#define test63_HelloWorld_pollenPrintProxy__V test63_HelloWorld.pollenPrintProxy
