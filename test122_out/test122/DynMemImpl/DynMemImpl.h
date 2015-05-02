
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test122_TestProg_pollen__reset__E();
void test122_TestProg_pollen__ready__E();
void test122_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test122_DynMemImpl_ test122_DynMemImpl;

/*
 * ======== struct module definition (unit DynMemImpl) ========
 */

struct test122_DynMemImpl_ {
};
typedef struct test122_DynMemImpl_ test122_DynMemImpl_;

/*
 * ======== function members (unit DynMemImpl) ========
 */

extern void test122_DynMemImpl_malloc__E( uint8 bytes );
extern void test122_DynMemImpl_free__E( uint8 bytes );
extern void test122_DynMemImpl_targetInit__I();


/*
 * ======== data members (unit DynMemImpl) ========
 */

