
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

extern struct local_mcu_Cpu_ local_mcu_Cpu;

/*
 * ======== struct module definition (unit Cpu) ========
 */

struct local_mcu_Cpu_ {
    uint32 sysFreq;
};
typedef struct local_mcu_Cpu_ local_mcu_Cpu_;

/*
 * ======== function members (unit Cpu) ========
 */

extern void local_mcu_Cpu_wait__E( uint16 us );
extern uint32 local_mcu_Cpu_getFrequency__E();
extern void local_mcu_Cpu_reset__E();
extern void local_mcu_Cpu_cycle__E();
extern void local_mcu_Cpu_targetInit__I();
extern void local_mcu_Cpu_shutdown__E();
extern void local_mcu_Cpu_setFrequency__E( uint32 hz );


/*
 * ======== data members (unit Cpu) ========
 */

#define local_mcu_Cpu_sysFreq__V local_mcu_Cpu.sysFreq
