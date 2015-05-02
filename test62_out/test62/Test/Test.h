
/*
 * ======== imports ========
 */

#ifndef test62_ArrMod__M
#define test62_ArrMod__M
#include "../../test62/ArrMod/ArrMod.h"
#endif

#ifndef test62_ArrCls__M
#define test62_ArrCls__M
#include "../../test62/ArrCls/ArrCls.h"
#endif

#ifndef test62_ArrHostDim__M
#define test62_ArrHostDim__M
#include "../../test62/ArrHostDim/ArrHostDim.h"
#endif

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test62_Test_pollen__reset__E();
void test62_Test_pollen__ready__E();
void test62_Test_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test62_Test_ test62_Test;

/*
 * ======== struct module definition (unit Test) ========
 */

struct test62_ArrCls;
struct test61_PrintImpl_;
struct test62_Test_ {
    struct test61_PrintImpl_ *pollenPrintProxy;
};
typedef struct test62_Test_ test62_Test_;

/*
 * ======== host variables (unit Test) ========
 */

typedef struct test62_ArrCls test62_Test_ac__TYPE;
extern test62_Test_ac__TYPE test62_Test_ac__V;
typedef struct test62_ArrHostDim_ClsHostDim test62_Test_cls__TYPE;
extern test62_Test_cls__TYPE test62_Test_cls__V;

/*
 * ======== function members (unit Test) ========
 */

extern void test62_Test_pollen__run__E();
extern void test62_Test_targetInit__I();


/*
 * ======== data members (unit Test) ========
 */

#define test62_Test_ac__V test62_Test_ac
#define test62_Test_cls__V test62_Test_cls
#define test62_Test_pollenPrintProxy__V test62_Test.pollenPrintProxy
