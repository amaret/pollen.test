
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void localhost_Lifecycle_pollen__reset__E();
void localhost_Lifecycle_pollen__ready__E();
void localhost_Lifecycle_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct local_mcu_ConsolePrint_ local_mcu_ConsolePrint;

/*
 * ======== struct module definition (unit ConsolePrint) ========
 */

struct local_mcu_ConsolePrint_ {
    const string HEADER;
    const string OKBLUE;
    const string OKGREEN;
    const string WARNING;
    const string FAIL;
    const string ENDC;
};
typedef struct local_mcu_ConsolePrint_ local_mcu_ConsolePrint_;

/*
 * ======== function members (unit ConsolePrint) ========
 */

extern void local_mcu_ConsolePrint_printUint__E( uint32 u );
extern void local_mcu_ConsolePrint_printInt__E( int32 i );
extern void local_mcu_ConsolePrint_printReal__E( float f );
extern void local_mcu_ConsolePrint_printBool__E( bool b );
extern void local_mcu_ConsolePrint_targetInit__I();
extern void local_mcu_ConsolePrint_printStr__E( string s );


/*
 * ======== const definitions ========
 */

#define local_mcu_ConsolePrint_HEADER (local_mcu_ConsolePrint__s__0)
#define local_mcu_ConsolePrint_OKBLUE (local_mcu_ConsolePrint__s__1)
#define local_mcu_ConsolePrint_OKGREEN (local_mcu_ConsolePrint__s__2)
#define local_mcu_ConsolePrint_WARNING (local_mcu_ConsolePrint__s__3)
#define local_mcu_ConsolePrint_FAIL (local_mcu_ConsolePrint__s__4)
#define local_mcu_ConsolePrint_ENDC (local_mcu_ConsolePrint__s__5)

/*
 * ======== data members (unit ConsolePrint) ========
 */

#define local_mcu_ConsolePrint_HEADER__V local_mcu_ConsolePrint.HEADER
#define local_mcu_ConsolePrint_OKBLUE__V local_mcu_ConsolePrint.OKBLUE
#define local_mcu_ConsolePrint_OKGREEN__V local_mcu_ConsolePrint.OKGREEN
#define local_mcu_ConsolePrint_WARNING__V local_mcu_ConsolePrint.WARNING
#define local_mcu_ConsolePrint_FAIL__V local_mcu_ConsolePrint.FAIL
#define local_mcu_ConsolePrint_ENDC__V local_mcu_ConsolePrint.ENDC
