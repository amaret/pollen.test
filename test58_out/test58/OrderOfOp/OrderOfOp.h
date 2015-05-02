
/*
 * ======== imports ========
 */

#ifndef test58_IncArrTest__M
#define test58_IncArrTest__M
#include "../../test58/IncArrTest/IncArrTest.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test58_OrderOfOp_pollen__reset__E();
void test58_OrderOfOp_pollen__ready__E();
void test58_OrderOfOp_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test58_OrderOfOp_ test58_OrderOfOp;

/*
 * ======== struct module definition (unit OrderOfOp) ========
 */

struct test58_OrderOfOp_ {
    const uint8 NOFADE;
    uint8 fading;
    uint8 fadecount;
};
typedef struct test58_OrderOfOp_ test58_OrderOfOp_;

/*
 * ======== function members (unit OrderOfOp) ========
 */

extern void test58_OrderOfOp_pollen__run__E();
extern void test58_OrderOfOp_targetInit__I();


/*
 * ======== const definitions ========
 */

#define test58_OrderOfOp_NOFADE (0)

/*
 * ======== data members (unit OrderOfOp) ========
 */

#define test58_OrderOfOp_NOFADE__V test58_OrderOfOp.NOFADE
#define test58_OrderOfOp_fading__V test58_OrderOfOp.fading
#define test58_OrderOfOp_fadecount__V test58_OrderOfOp.fadecount
