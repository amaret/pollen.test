
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test17_TimerManagerTest_pollen__reset__E();
void test17_TimerManagerTest_pollen__ready__E();
void test17_TimerManagerTest_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct mcu_atmel_atmega_Timer0MatchA_ mcu_atmel_atmega_Timer0MatchA;

/*
 * ======== struct module definition (unit Timer0MatchA) ========
 */

typedef void (*mcu_atmel_atmega_Timer0MatchA_Handler_handle)();
struct mcu_atmel_atmega_Timer0MatchA_ {
    mcu_atmel_atmega_Timer0MatchA_Handler_handle h;
};
typedef struct mcu_atmel_atmega_Timer0MatchA_ mcu_atmel_atmega_Timer0MatchA_;

/*
 * ======== function members (unit Timer0MatchA) ========
 */

extern void mcu_atmel_atmega_Timer0MatchA_setHandler__E( mcu_atmel_atmega_Timer0MatchA_Handler_handle h );
extern void mcu_atmel_atmega_Timer0MatchA_enable__E();
extern void mcu_atmel_atmega_Timer0MatchA_disable__E();
extern void mcu_atmel_atmega_Timer0MatchA_clear__E();
extern void mcu_atmel_atmega_Timer0MatchA_isr__I();
extern void mcu_atmel_atmega_Timer0MatchA_targetInit__I();
extern bool mcu_atmel_atmega_Timer0MatchA_enabled__E();


/*
 * ======== const definitions ========
 */

#define mcu_atmel_atmega_Timer0MatchA_name (mcu_atmel_atmega_Timer0MatchA__s__1)
#define mcu_atmel_atmega_Timer0MatchA_enableRegister (mcu_atmel_atmega_Timer0MatchA__s__2)
#define mcu_atmel_atmega_Timer0MatchA_enableBit (mcu_atmel_atmega_Timer0MatchA__s__3)
#define mcu_atmel_atmega_Timer0MatchA_clearRegister (mcu_atmel_atmega_Timer0MatchA__s__4)
#define mcu_atmel_atmega_Timer0MatchA_clearBit (mcu_atmel_atmega_Timer0MatchA__s__5)

/*
 * ======== data members (unit Timer0MatchA) ========
 */

#define mcu_atmel_atmega_Timer0MatchA_h__V mcu_atmel_atmega_Timer0MatchA.h
