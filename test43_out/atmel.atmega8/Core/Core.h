
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test43_BlinkEnvLed_pollen__reset__E();
void test43_BlinkEnvLed_pollen__ready__E();
void test43_BlinkEnvLed_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct atmel_atmega8_Core_ atmel_atmega8_Core;

/*
 * ======== struct module definition (unit Core) ========
 */

struct atmel_atmega8_Core_ {
    uint32 sysFreq;
};
typedef struct atmel_atmega8_Core_ atmel_atmega8_Core_;

/*
 * ======== host variables (unit Core) ========
 */

typedef uint8 atmel_atmega8_Core_nops__TYPE;
extern const atmel_atmega8_Core_nops__TYPE atmel_atmega8_Core_nops__V;

/*
 * ======== function members (unit Core) ========
 */

extern void atmel_atmega8_Core_wait__E( uint16 us );
extern uint32 atmel_atmega8_Core_getFrequency__E();
extern void atmel_atmega8_Core_reset__E();
extern void atmel_atmega8_Core_cycle__E();
extern void atmel_atmega8_Core_targetInit__I();
extern void atmel_atmega8_Core_shutdown__E();
extern void atmel_atmega8_Core_setFrequency__E( uint32 hz );


/*
 * ======== data members (unit Core) ========
 */

#define atmel_atmega8_Core_sysFreq__V atmel_atmega8_Core.sysFreq
