
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test1_BlinkMilli_pollen__reset__E();
void test1_BlinkMilli_pollen__ready__E();
void test1_BlinkMilli_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Cls2) ========
 */

struct test1_Cls2 {
    uint32 us;
    uint32 ticksPerUs;
};
typedef struct test1_Cls2 test1_Cls2;
typedef struct test1_Cls2* test1_Cls2_;


/*
 * ======== function members (unit Cls2) ========
 */

extern void test1_Cls2_Cls2_foo__E( test1_Cls2_ this );
extern void test1_Cls2_Cls2_markUsed__E( test1_Cls2_ this );
extern test1_Cls2_ test1_Cls2_Cls2_new___E( test1_Cls2_ this );

