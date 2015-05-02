
/*
 * ======== imports ========
 */

#ifndef test95_ArrMod__M
#define test95_ArrMod__M
#include "../../test95/ArrMod/ArrMod.h"
#endif

#ifndef test95_Arr__M
#define test95_Arr__M
#include "../../test95/Arr/Arr.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test95_Test_pollen__reset__E();
void test95_Test_pollen__ready__E();
void test95_Test_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test95_Test_ test95_Test;

/*
 * ======== struct module definition (unit Test) ========
 */

struct test54_PrintImpl_;
struct test95_Test_ {
    test95_Arr_Cls_ cls;
    uint8 arr[8];
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test95_Test_ test95_Test_;

/*
 * ======== host variables (unit Test) ========
 */

typedef struct test95_Arr_Cls test95_Test_host_cls__TYPE;
extern test95_Test_host_cls__TYPE test95_Test_host_cls__V;
typedef uint32 test95_Test_Test_i__TYPE;
extern const test95_Test_Test_i__TYPE test95_Test_Test_i__V;

/*
 * ======== function members (unit Test) ========
 */

extern void test95_Test_pollen__run__E();
extern void test95_Test_targetInit__I();


/*
 * ======== data members (unit Test) ========
 */

#define test95_Test_host_cls__V test95_Test_host_cls
#define test95_Test_cls__V test95_Test.cls
#define test95_Test_arr__A test95_Test.arr
#define test95_Test_pollenPrintProxy__V test95_Test.pollenPrintProxy
