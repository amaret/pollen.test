
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test56_TestProg_pollen__reset__E();
void test56_TestProg_pollen__ready__E();
void test56_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test56_PrintImpl_ test56_PrintImpl;

/*
 * ======== struct module definition (unit PrintImpl) ========
 */

struct test56_PrintImpl_ {
};
typedef struct test56_PrintImpl_ test56_PrintImpl_;

/*
 * ======== function members (unit PrintImpl) ========
 */

extern void test56_PrintImpl_printUint__E( uint32 u );
extern void test56_PrintImpl_printInt__E( int32 i );
extern void test56_PrintImpl_printReal__E( float f );
extern void test56_PrintImpl_printBool__E( bool b );
extern void test56_PrintImpl_targetInit__I();
extern void test56_PrintImpl_printStr__E( string s );


/*
 * ======== data members (unit PrintImpl) ========
 */

