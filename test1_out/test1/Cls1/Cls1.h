
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
 * ======== class definition (unit Cls1) ========
 */

struct test1_Cls1 {
    uint8 red;
    uint8 green;
    uint8 blue;
    uint8 blueInitialValue;
};
typedef struct test1_Cls1 test1_Cls1;
typedef struct test1_Cls1* test1_Cls1_;


/*
 * ======== host variables (unit Cls1) ========
 */

typedef uint8 test1_Cls1_blueInitialValue__TYPE;
extern test1_Cls1_blueInitialValue__TYPE test1_Cls1_blueInitialValue__V;

/*
 * ======== function members (unit Cls1) ========
 */

extern void test1_Cls1_Cls1_markUsed__E( test1_Cls1_ this );
extern test1_Cls1_ test1_Cls1_Cls1_new___E( test1_Cls1_ this );

