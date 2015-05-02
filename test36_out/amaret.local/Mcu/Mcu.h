
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test36_Blink3_pollen__reset__E();
void test36_Blink3_pollen__ready__E();
void test36_Blink3_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct amaret_local_Mcu_ amaret_local_Mcu;

/*
 * ======== struct module definition (unit Mcu) ========
 */

struct amaret_local_Mcu_ {
    uint32 sysFreq;
};
typedef struct amaret_local_Mcu_ amaret_local_Mcu_;

/*
 * ======== function members (unit Mcu) ========
 */

extern void amaret_local_Mcu_wait__E( uint32 us );
extern uint32 amaret_local_Mcu_getFrequency__E();
extern void amaret_local_Mcu_reset__E();
extern void amaret_local_Mcu_cycle__E();
extern void amaret_local_Mcu_targetInit__I();
extern void amaret_local_Mcu_shutdown__E();
extern void amaret_local_Mcu_setFrequency__E( uint32 hz );


/*
 * ======== data members (unit Mcu) ========
 */

#define amaret_local_Mcu_sysFreq__V amaret_local_Mcu.sysFreq
