
/*
 * ======== imports ========
 */

#ifndef test84_MPT1__M
#define test84_MPT1__M
#include "../../test84/MPT1/MPT1.h"
#endif

#ifndef test84_MPT2__M
#define test84_MPT2__M
#include "../../test84/MPT2/MPT2.h"
#endif

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test84_MetaPinTestMod_pollen__reset__E();
void test84_MetaPinTestMod_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test84_MetaPinTestMod_ test84_MetaPinTestMod;

/*
 * ======== struct module definition (unit MetaPinTestMod) ========
 */

struct test61_PrintImpl_;
struct test84_MetaPinTestMod_ {
    struct test61_PrintImpl_ *pollenPrintProxy;
};
typedef struct test84_MetaPinTestMod_ test84_MetaPinTestMod_;

/*
 * ======== function members (unit MetaPinTestMod) ========
 */

extern void test84_MetaPinTestMod_pollen__run__E();
extern void test84_MetaPinTestMod_pollen__shutdown__E( uint8 id );
extern void test84_MetaPinTestMod_targetInit__I();


/*
 * ======== data members (unit MetaPinTestMod) ========
 */

#define test84_MetaPinTestMod_pollenPrintProxy__V test84_MetaPinTestMod.pollenPrintProxy
