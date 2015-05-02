
/*
 * ======== imports ========
 */

#ifndef test1_GlobalInterrupts__M
#define test1_GlobalInterrupts__M
#include "../../test1/GlobalInterrupts/GlobalInterrupts.h"
#endif

#ifndef test1_Cls2__M
#define test1_Cls2__M
#include "../../test1/Cls2/Cls2.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test1_BlinkMilli_pollen__reset__E();
void test1_BlinkMilli_pollen__ready__E();
void test1_BlinkMilli_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Cls3) ========
 */

struct test1_GlobalInterrupts_;
struct test1_Cls3_Cls4 {
    uint8 i;
    struct test1_GlobalInterrupts_*  gi_class_nest;
};
typedef struct test1_Cls3_Cls4 test1_Cls3_Cls4;
typedef struct test1_Cls3_Cls4* test1_Cls3_Cls4_;
struct test1_Cls2;
struct test1_Cls3 {
    struct test1_GlobalInterrupts_*  gi_class;
    test1_Cls3_Cls4 c1;
    struct test1_Cls2  c2;
};
typedef struct test1_Cls3 test1_Cls3;
typedef struct test1_Cls3* test1_Cls3_;


/*
 * ======== host variables (unit Cls3) ========
 */

typedef struct test1_Cls3_Cls4 test1_Cls3_c1__TYPE;
extern test1_Cls3_c1__TYPE test1_Cls3_c1__V;
typedef struct test1_Cls2 test1_Cls3_c2__TYPE;
extern test1_Cls3_c2__TYPE test1_Cls3_c2__V;

/*
 * ======== function members (unit Cls3) ========
 */

extern void test1_Cls3_Cls3_pollen__run__E( test1_Cls3_ this );
extern void test1_Cls3_Cls3_markUsed__E( test1_Cls3_ this );
extern test1_Cls3_Cls4_ test1_Cls3_Cls4_new___E( test1_Cls3_Cls4_ this );
extern test1_Cls3_ test1_Cls3_Cls3_new___E( test1_Cls3_ this );

