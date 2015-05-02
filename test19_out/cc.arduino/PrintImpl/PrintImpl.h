
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test19_BlinkMilli2_pollen__reset__E();
void test19_BlinkMilli2_pollen__ready__E();
void test19_BlinkMilli2_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct cc_arduino_PrintImpl_ cc_arduino_PrintImpl;

/*
 * ======== struct module definition (unit PrintImpl) ========
 */

struct cc_arduino_PrintImpl_ {
};
typedef struct cc_arduino_PrintImpl_ cc_arduino_PrintImpl_;

/*
 * ======== function members (unit PrintImpl) ========
 */

extern void cc_arduino_PrintImpl_printUint__E( uint32 u );
extern void cc_arduino_PrintImpl_printInt__E( int32 i );
extern void cc_arduino_PrintImpl_printReal__E( float f );
extern void cc_arduino_PrintImpl_printBool__E( bool b );
extern void cc_arduino_PrintImpl_targetInit__I();
extern void cc_arduino_PrintImpl_printStr__E( string s );


/*
 * ======== data members (unit PrintImpl) ========
 */

