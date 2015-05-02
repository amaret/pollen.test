
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test121_Test_01_pollen__reset__E();
void test121_Test_01_pollen__ready__E();
void test121_Test_01_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct atmel_atmega_Cpu_ atmel_atmega_Cpu;

/*
 * ======== struct module definition (unit Cpu) ========
 */

struct atmel_atmega_Cpu_ {
    uint32 sysFreq;
};
typedef struct atmel_atmega_Cpu_ atmel_atmega_Cpu_;

/*
 * ======== host variables (unit Cpu) ========
 */

typedef uint32 atmel_atmega_Cpu_ticksPerUs__TYPE;
extern const atmel_atmega_Cpu_ticksPerUs__TYPE atmel_atmega_Cpu_ticksPerUs__V;

/*
 * ======== function members (unit Cpu) ========
 */

extern void atmel_atmega_Cpu_wait__E( uint16 us );
extern uint32 atmel_atmega_Cpu_getFrequency__E();
extern void atmel_atmega_Cpu_reset__E();
extern void atmel_atmega_Cpu_cycle__E();
extern void atmel_atmega_Cpu_targetInit__I();
extern void atmel_atmega_Cpu_shutdown__E();
extern void atmel_atmega_Cpu_setFrequency__E( uint32 hz );


/*
 * ======== data members (unit Cpu) ========
 */

#define atmel_atmega_Cpu_sysFreq__V atmel_atmega_Cpu.sysFreq
