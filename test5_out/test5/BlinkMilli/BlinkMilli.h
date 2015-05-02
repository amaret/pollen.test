
/*
 * ======== imports ========
 */

#ifndef pollen_time_TimerMilli__M
#define pollen_time_TimerMilli__M
#include "../../pollen.time/TimerMilli/TimerMilli.h"
#endif

#ifndef pollen_events_Dispatcher__M
#define pollen_events_Dispatcher__M
#include "../../pollen.events/Dispatcher/Dispatcher.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test5_BlinkMilli_pollen__ready__E();
void test5_BlinkMilli_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test5_BlinkMilli_ test5_BlinkMilli;

/*
 * ======== struct module definition (unit BlinkMilli) ========
 */

struct test5_BlinkMilli_ {
};
typedef struct test5_BlinkMilli_ test5_BlinkMilli_;

/*
 * ======== function members (unit BlinkMilli) ========
 */

extern void test5_BlinkMilli_pollen__reset__E();
extern void test5_BlinkMilli_pollen__run__E();
extern void test5_BlinkMilli_madams_chkArray__I();
extern void test5_BlinkMilli_toggle__I();
extern void test5_BlinkMilli_targetInit__I();


/*
 * ======== data members (unit BlinkMilli) ========
 */

