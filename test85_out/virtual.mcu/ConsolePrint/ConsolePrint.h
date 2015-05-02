
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test85_Test_11_pollen__reset__E();
void test85_Test_11_pollen__ready__E();
void test85_Test_11_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct virtual_mcu_ConsolePrint_ virtual_mcu_ConsolePrint;

/*
 * ======== struct module definition (unit ConsolePrint) ========
 */

struct virtual_mcu_ConsolePrint_ {
    const string HEADER;
    const string OKBLUE;
    const string OKGREEN;
    const string WARNING;
    const string FAIL;
    const string ENDC;
};
typedef struct virtual_mcu_ConsolePrint_ virtual_mcu_ConsolePrint_;

/*
 * ======== function members (unit ConsolePrint) ========
 */

extern void virtual_mcu_ConsolePrint_printUint__E( uint32 u );
extern void virtual_mcu_ConsolePrint_printReal__E( float f );
extern void virtual_mcu_ConsolePrint_printInt__E( int32 i );
extern void virtual_mcu_ConsolePrint_printBool__E( bool b );
extern void virtual_mcu_ConsolePrint_targetInit__I();
extern void virtual_mcu_ConsolePrint_printStr__E( string s );


/*
 * ======== const definitions ========
 */

#define virtual_mcu_ConsolePrint_HEADER (virtual_mcu_ConsolePrint__s__0)
#define virtual_mcu_ConsolePrint_OKBLUE (virtual_mcu_ConsolePrint__s__1)
#define virtual_mcu_ConsolePrint_OKGREEN (virtual_mcu_ConsolePrint__s__2)
#define virtual_mcu_ConsolePrint_WARNING (virtual_mcu_ConsolePrint__s__3)
#define virtual_mcu_ConsolePrint_FAIL (virtual_mcu_ConsolePrint__s__4)
#define virtual_mcu_ConsolePrint_ENDC (virtual_mcu_ConsolePrint__s__5)

/*
 * ======== data members (unit ConsolePrint) ========
 */

#define virtual_mcu_ConsolePrint_HEADER__V virtual_mcu_ConsolePrint.HEADER
#define virtual_mcu_ConsolePrint_OKBLUE__V virtual_mcu_ConsolePrint.OKBLUE
#define virtual_mcu_ConsolePrint_OKGREEN__V virtual_mcu_ConsolePrint.OKGREEN
#define virtual_mcu_ConsolePrint_WARNING__V virtual_mcu_ConsolePrint.WARNING
#define virtual_mcu_ConsolePrint_FAIL__V virtual_mcu_ConsolePrint.FAIL
#define virtual_mcu_ConsolePrint_ENDC__V virtual_mcu_ConsolePrint.ENDC
