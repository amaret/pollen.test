
/*
 * ======== imports ========
 */

#ifndef virtual_mcu_TimerMilli__M
#define virtual_mcu_TimerMilli__M
#include "../../virtual.mcu/TimerMilli/TimerMilli.h"
#endif

#ifndef virtual_mcu_GlobalInterrupts__M
#define virtual_mcu_GlobalInterrupts__M
#include "../../virtual.mcu/GlobalInterrupts/GlobalInterrupts.h"
#endif

#ifndef pollen_event_Newsroom__M
#define pollen_event_Newsroom__M
#include "../../pollen.event/Newsroom/Newsroom.h"
#endif

#ifndef pollen_time_Timer__M
#define pollen_time_Timer__M
#include "../../pollen.time/Timer/Timer.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test77_Test_21_pollen__reset__E();
void test77_Test_21_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test77_Test_21_ test77_Test_21;

/*
 * ======== struct module definition (unit Test_21) ========
 */

struct pollen_time_Timer;
struct test77_Test_21_ {
};
typedef struct test77_Test_21_ test77_Test_21_;

/*
 * ======== host variables (unit Test_21) ========
 */

typedef struct pollen_time_Timer test77_Test_21_t1__TYPE;
extern test77_Test_21_t1__TYPE test77_Test_21_t1__V;
typedef struct pollen_time_Timer test77_Test_21_t2__TYPE;
extern test77_Test_21_t2__TYPE test77_Test_21_t2__V;
typedef struct pollen_time_Timer test77_Test_21_t3__TYPE;
extern test77_Test_21_t3__TYPE test77_Test_21_t3__V;

/*
 * ======== function members (unit Test_21) ========
 */

extern void test77_Test_21_tick3__I();
extern void test77_Test_21_pollen__run__E();
extern void test77_Test_21_tick2__I();
extern void test77_Test_21_tick1__I();
extern void test77_Test_21_pollen__shutdown__E( uint8 id );
extern void test77_Test_21_targetInit__I();


/*
 * ======== data members (unit Test_21) ========
 */

#define test77_Test_21_t1__V test77_Test_21_t1
#define test77_Test_21_t2__V test77_Test_21_t2
#define test77_Test_21_t3__V test77_Test_21_t3
