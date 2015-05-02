
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test52_HelloWorld_pollen__reset__E();
void test52_HelloWorld_pollen__ready__E();
void test52_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test61_PrintImpl_ test61_PrintImpl;

/*
 * ======== struct module definition (unit PrintImpl) ========
 */

struct test61_PrintImpl_ {
};
typedef struct test61_PrintImpl_ test61_PrintImpl_;

/*
 * ======== function members (unit PrintImpl) ========
 */

extern void test61_PrintImpl_printUint__E( uint32 u );
extern void test61_PrintImpl_printInt__E( int32 i );
extern void test61_PrintImpl_printReal__E( float f );
extern void test61_PrintImpl_printBool__E( bool b );
extern void test61_PrintImpl_targetInit__I();
extern void test61_PrintImpl_printStr__E( string s );


/*
 * ======== data members (unit PrintImpl) ========
 */

