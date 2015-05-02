
/*
 * ======== imports ========
 */

#ifndef test76_ArrNoDim__M
#define test76_ArrNoDim__M
#include "../../test76/ArrNoDim/ArrNoDim.h"
#endif

#ifndef test76_FcnArrParm__M
#define test76_FcnArrParm__M
#include "../../test76/FcnArrParm/FcnArrParm.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test76_Test_pollen__reset__E();
void test76_Test_pollen__ready__E();
void test76_Test_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test76_Test_ test76_Test;

/*
 * ======== struct module definition (unit Test) ========
 */

struct test54_PrintImpl_;
struct test76_Test_ {
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test76_Test_ test76_Test_;

/*
 * ======== function members (unit Test) ========
 */

extern void test76_Test_pollen__run__E();
extern void test76_Test_targetInit__I();


/*
 * ======== data members (unit Test) ========
 */

#define test76_Test_pollenPrintProxy__V test76_Test.pollenPrintProxy
