
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

void test71_Test_pollen__reset__E();
void test71_Test_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test71_Test_ test71_Test;

/*
 * ======== struct module definition (unit Test) ========
 */

struct test61_PrintImpl_;
struct test71_Test_ {
    struct test61_PrintImpl_ *pollenPrintProxy;
};
typedef struct test71_Test_ test71_Test_;

/*
 * ======== function members (unit Test) ========
 */

extern void test71_Test_pollen__run__E();
extern void test71_Test_pollen__shutdown__E( uint8 id );
extern void test71_Test_targetInit__I();


/*
 * ======== data members (unit Test) ========
 */

#define test71_Test_pollenPrintProxy__V test71_Test.pollenPrintProxy
