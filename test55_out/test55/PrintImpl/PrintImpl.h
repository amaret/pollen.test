
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test55_TestProg_pollen__reset__E();
void test55_TestProg_pollen__ready__E();
void test55_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test55_PrintImpl_ test55_PrintImpl;

/*
 * ======== struct module definition (unit PrintImpl) ========
 */

struct test55_PrintImpl_ {
};
typedef struct test55_PrintImpl_ test55_PrintImpl_;

/*
 * ======== function members (unit PrintImpl) ========
 */

extern void test55_PrintImpl_printUint__E( uint32 u );
extern void test55_PrintImpl_printInt__E( int32 i );
extern void test55_PrintImpl_printReal__E( float f );
extern void test55_PrintImpl_printBool__E( bool b );
extern void test55_PrintImpl_targetInit__I();
extern void test55_PrintImpl_printStr__E( string s );


/*
 * ======== data members (unit PrintImpl) ========
 */

