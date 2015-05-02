
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test117_TestProg_pollen__reset__E();
void test117_TestProg_pollen__ready__E();
void test117_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test117_ArrayReturn_ test117_ArrayReturn;

/*
 * ======== class definition (unit ArrayReturn.Cls1) ========
 */

struct test117_ArrayReturn_Cls1 {
    uint8 cVar;
};
typedef struct test117_ArrayReturn_Cls1 test117_ArrayReturn_Cls1;
typedef struct test117_ArrayReturn_Cls1* test117_ArrayReturn_Cls1_;

/*
 * ======== struct module definition (unit ArrayReturn) ========
 */

struct test117_ArrayReturn_ {
    test117_ArrayReturn_Cls1_ arrCls1Ref[1];
};
typedef struct test117_ArrayReturn_ test117_ArrayReturn_;

/*
 * ======== host variables (unit ArrayReturn) ========
 */

typedef test117_ArrayReturn_Cls1 test117_ArrayReturn_arrCls1Inst__TYPE;
extern test117_ArrayReturn_arrCls1Inst__TYPE test117_ArrayReturn_arrCls1Inst__A[];

/*
 * ======== function members (unit ArrayReturn) ========
 */

extern test117_ArrayReturn_Cls1_  test117_ArrayReturn_foofoo1__I();
extern void test117_ArrayReturn_bar__E();
extern test117_ArrayReturn_Cls1_  test117_ArrayReturn_foofoo2__I();
extern uint8 test117_ArrayReturn_Cls1_getcVar__I( test117_ArrayReturn_Cls1_ this );
extern test117_ArrayReturn_Cls1_ test117_ArrayReturn_Cls1_new___E( test117_ArrayReturn_Cls1_ this );
extern void test117_ArrayReturn_targetInit__I();


/*
 * ======== data members (unit ArrayReturn) ========
 */

#define test117_ArrayReturn_arrCls1Ref__A test117_ArrayReturn.arrCls1Ref
#define test117_ArrayReturn_arrCls1Ref_cVar__A test117_ArrayReturn.arrCls1Ref->cVar
#define test117_ArrayReturn_arrCls1Ref_getcVar__A test117_ArrayReturn.arrCls1Ref->getcVar
#define test117_ArrayReturn_arrCls1Ref_new_host__A test117_ArrayReturn.arrCls1Ref->new_host
#define test117_ArrayReturn_arrCls1Ref_new___A test117_ArrayReturn.arrCls1Ref->new_
