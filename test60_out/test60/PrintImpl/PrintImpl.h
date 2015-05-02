
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test60_TestProg_pollen__reset__E();
void test60_TestProg_pollen__ready__E();
void test60_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test60_PrintImpl_ test60_PrintImpl;

/*
 * ======== struct module definition (unit PrintImpl) ========
 */

struct test60_PrintImpl_ {
};
typedef struct test60_PrintImpl_ test60_PrintImpl_;

/*
 * ======== function members (unit PrintImpl) ========
 */

extern void test60_PrintImpl_printUint__E( uint32 u );
extern void test60_PrintImpl_printInt__E( int32 i );
extern void test60_PrintImpl_printReal__E( float f );
extern void test60_PrintImpl_printBool__E( bool b );
extern void test60_PrintImpl_targetInit__I();
extern void test60_PrintImpl_printStr__E( string s );


/*
 * ======== data members (unit PrintImpl) ========
 */

