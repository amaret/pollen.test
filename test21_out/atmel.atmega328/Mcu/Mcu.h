
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test21_Blink2_pollen__reset__E();
void test21_Blink2_pollen__ready__E();
void test21_Blink2_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct atmel_atmega328_Mcu_ atmel_atmega328_Mcu;

/*
 * ======== struct module definition (unit Mcu) ========
 */

struct atmel_atmega328_Mcu_ {
    uint32 sysFreq;
};
typedef struct atmel_atmega328_Mcu_ atmel_atmega328_Mcu_;

/*
 * ======== function members (unit Mcu) ========
 */

extern void atmel_atmega328_Mcu_wait__E( uint32 us );
extern uint32 atmel_atmega328_Mcu_getFrequency__E();
extern void atmel_atmega328_Mcu_reset__E();
extern void atmel_atmega328_Mcu_cycle__E();
extern void atmel_atmega328_Mcu_targetInit__I();
extern void atmel_atmega328_Mcu_shutdown__E();
extern void atmel_atmega328_Mcu_setFrequency__E( uint32 hz );


/*
 * ======== data members (unit Mcu) ========
 */

#define atmel_atmega328_Mcu_sysFreq__V atmel_atmega328_Mcu.sysFreq
