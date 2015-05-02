
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test70_QueueBug_01_pollen__reset__E();
void test70_QueueBug_01_pollen__ready__E();
void test70_QueueBug_01_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test54_PrintImpl_ test54_PrintImpl;

/*
 * ======== struct module definition (unit PrintImpl) ========
 */

struct test54_PrintImpl_ {
};
typedef struct test54_PrintImpl_ test54_PrintImpl_;

/*
 * ======== function members (unit PrintImpl) ========
 */

extern void test54_PrintImpl_printUint__E( uint32 u );
extern void test54_PrintImpl_printInt__E( int32 i );
extern void test54_PrintImpl_printReal__E( float f );
extern void test54_PrintImpl_printBool__E( bool b );
extern void test54_PrintImpl_targetInit__I();
extern void test54_PrintImpl_printStr__E( string s );


/*
 * ======== data members (unit PrintImpl) ========
 */

