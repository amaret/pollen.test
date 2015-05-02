
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test5_BlinkMilli_pollen__reset__E();
void test5_BlinkMilli_pollen__ready__E();
void test5_BlinkMilli_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct mcu_atmel_atmega328p_Atmega328p_ mcu_atmel_atmega328p_Atmega328p;

/*
 * ======== struct module definition (unit Atmega328p) ========
 */

struct mcu_atmel_atmega328p_Atmega328p_ {
    uint32 sysFreq;
};
typedef struct mcu_atmel_atmega328p_Atmega328p_ mcu_atmel_atmega328p_Atmega328p_;

/*
 * ======== function members (unit Atmega328p) ========
 */

extern uint32 mcu_atmel_atmega328p_Atmega328p_getSystemFrequency__E();
extern void mcu_atmel_atmega328p_Atmega328p_wait__E( uint32 us );
extern void mcu_atmel_atmega328p_Atmega328p_setSystemFrequency__E( uint32 hz );
extern void mcu_atmel_atmega328p_Atmega328p_reset__E();
extern void mcu_atmel_atmega328p_Atmega328p_targetInit__I();
extern void mcu_atmel_atmega328p_Atmega328p_shutdown__E();
extern void mcu_atmel_atmega328p_Atmega328p_nop__E();


/*
 * ======== data members (unit Atmega328p) ========
 */

#define mcu_atmel_atmega328p_Atmega328p_sysFreq__V mcu_atmel_atmega328p_Atmega328p.sysFreq
