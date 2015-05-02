
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

extern struct local_mcu_GlobalInterrupts_ local_mcu_GlobalInterrupts;

/*
 * ======== struct module definition (unit GlobalInterrupts) ========
 */

struct local_mcu_GlobalInterrupts_ {
    bool enabled;
};
typedef struct local_mcu_GlobalInterrupts_ local_mcu_GlobalInterrupts_;

/*
 * ======== function members (unit GlobalInterrupts) ========
 */

extern void local_mcu_GlobalInterrupts_restore__E( bool state );
extern void local_mcu_GlobalInterrupts_enable__E();
extern void local_mcu_GlobalInterrupts_disable__E();
extern bool local_mcu_GlobalInterrupts_isEnabled__E();
extern void local_mcu_GlobalInterrupts_targetInit__I();


/*
 * ======== data members (unit GlobalInterrupts) ========
 */

#define local_mcu_GlobalInterrupts_enabled__V local_mcu_GlobalInterrupts.enabled
