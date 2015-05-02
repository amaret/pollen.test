
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

extern struct local_mcu_TimerMilli_ local_mcu_TimerMilli;

/*
 * ======== struct module definition (unit TimerMilli) ========
 */

typedef void (*local_mcu_TimerMilli_HP_handler)();
struct local_mcu_TimerMilli_ {
    local_mcu_TimerMilli_HP_handler tickHandler;
    bool repeat;
};
typedef struct local_mcu_TimerMilli_ local_mcu_TimerMilli_;

/*
 * ======== function members (unit TimerMilli) ========
 */

extern void local_mcu_TimerMilli_setHandler__E( local_mcu_TimerMilli_HP_handler h );
extern void local_mcu_TimerMilli_stop__E();
extern bool local_mcu_TimerMilli_isRunning__E();
extern void local_mcu_TimerMilli_resetTimer__I();
extern void local_mcu_TimerMilli_start__E();
extern void local_mcu_TimerMilli_targetInit__I();
extern void local_mcu_TimerMilli_sigAlarm__I();


/*
 * ======== data members (unit TimerMilli) ========
 */

#define local_mcu_TimerMilli_tickHandler__V local_mcu_TimerMilli.tickHandler
#define local_mcu_TimerMilli_repeat__V local_mcu_TimerMilli.repeat
