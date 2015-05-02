
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test39_Test0_pollen__reset__E();
void test39_Test0_pollen__ready__E();
void test39_Test0_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct atmel_atmega8_Timer0MatchA_ atmel_atmega8_Timer0MatchA;

/*
 * ======== struct module definition (unit Timer0MatchA) ========
 */

typedef void (*atmel_atmega8_Timer0MatchA_InterruptHandler_isr)();
struct atmel_atmega8_Timer0MatchA_ {
    atmel_atmega8_Timer0MatchA_InterruptHandler_isr handler;
};
typedef struct atmel_atmega8_Timer0MatchA_ atmel_atmega8_Timer0MatchA_;

/*
 * ======== function members (unit Timer0MatchA) ========
 */

extern void atmel_atmega8_Timer0MatchA_enable__E();
extern void atmel_atmega8_Timer0MatchA_disable__E();
extern bool atmel_atmega8_Timer0MatchA_isEnabled__E();
extern void atmel_atmega8_Timer0MatchA_clear__E();
extern void atmel_atmega8_Timer0MatchA_targetInit__I();


/*
 * ======== const definitions ========
 */

#define atmel_atmega8_Timer0MatchA_name (atmel_atmega8_Timer0MatchA__s__1)
#define atmel_atmega8_Timer0MatchA_enableRegister (atmel_atmega8_Timer0MatchA__s__2)
#define atmel_atmega8_Timer0MatchA_enableBit (atmel_atmega8_Timer0MatchA__s__3)
#define atmel_atmega8_Timer0MatchA_clearRegister (atmel_atmega8_Timer0MatchA__s__4)
#define atmel_atmega8_Timer0MatchA_clearBit (atmel_atmega8_Timer0MatchA__s__5)

/*
 * ======== data members (unit Timer0MatchA) ========
 */

#define atmel_atmega8_Timer0MatchA_handler__V atmel_atmega8_Timer0MatchA.handler
