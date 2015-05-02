
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test17_TimerManagerTest_pollen__reset__E();
void test17_TimerManagerTest_pollen__ready__E();
void test17_TimerManagerTest_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct pollen_time_TimerMilli_ pollen_time_TimerMilli;

/*
 * ======== struct module definition (unit TimerMilli) ========
 */

typedef void (*pollen_time_TimerMilli_Handler_handle)();
struct pollen_interfaces_TimerDriver_;
struct pollen_time_TimerMilli_ {
    struct pollen_interfaces_TimerDriver_ *timer;
    uint16 count;
    uint16 duration;
    bool repeat;
    pollen_time_TimerMilli_Handler_handle clientTick;
};
typedef struct pollen_time_TimerMilli_ pollen_time_TimerMilli_;

/*
 * ======== function members (unit TimerMilli) ========
 */

extern bool pollen_time_TimerMilli_running__E();
extern void pollen_time_TimerMilli_stop__E();
extern void pollen_time_TimerMilli_start__E( pollen_time_TimerMilli_Handler_handle h, uint16 duration, bool repeat );
extern void pollen_time_TimerMilli_targetInit__I();
extern void pollen_time_TimerMilli_timerTick__E();


/*
 * ======== data members (unit TimerMilli) ========
 */

#define pollen_time_TimerMilli_timer__V pollen_time_TimerMilli.timer
#define pollen_time_TimerMilli_count__V pollen_time_TimerMilli.count
#define pollen_time_TimerMilli_duration__V pollen_time_TimerMilli.duration
#define pollen_time_TimerMilli_repeat__V pollen_time_TimerMilli.repeat
#define pollen_time_TimerMilli_clientTick__V pollen_time_TimerMilli.clientTick
