
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test77_Test_21_pollen__reset__E();
void test77_Test_21_pollen__ready__E();
void test77_Test_21_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct virtual_mcu_TimerMilli_ virtual_mcu_TimerMilli;

/*
 * ======== struct module definition (unit TimerMilli) ========
 */

typedef void (*virtual_mcu_TimerMilli_HP_handler)();
struct virtual_mcu_TimerMilli_ {
    virtual_mcu_TimerMilli_HP_handler tickHandler;
    bool repeat;
};
typedef struct virtual_mcu_TimerMilli_ virtual_mcu_TimerMilli_;

/*
 * ======== function members (unit TimerMilli) ========
 */

extern void virtual_mcu_TimerMilli_setHandler__E( virtual_mcu_TimerMilli_HP_handler h );
extern void virtual_mcu_TimerMilli_stop__E();
extern bool virtual_mcu_TimerMilli_isRunning__E();
extern void virtual_mcu_TimerMilli_resetTimer__I();
extern void virtual_mcu_TimerMilli_start__E();
extern void virtual_mcu_TimerMilli_targetInit__I();
extern void virtual_mcu_TimerMilli_sigAlarm__I();


/*
 * ======== data members (unit TimerMilli) ========
 */

#define virtual_mcu_TimerMilli_tickHandler__V virtual_mcu_TimerMilli.tickHandler
#define virtual_mcu_TimerMilli_repeat__V virtual_mcu_TimerMilli.repeat
