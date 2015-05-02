
/*
 * ======== imports ========
 */

#ifndef local_mcu_TimerMilli__M
#define local_mcu_TimerMilli__M
#include "../../local.mcu/TimerMilli/TimerMilli.h"
#endif

#ifndef local_mcu_GlobalInterrupts__M
#define local_mcu_GlobalInterrupts__M
#include "../../local.mcu/GlobalInterrupts/GlobalInterrupts.h"
#endif

#ifndef local_mcu_ConsolePrint__M
#define local_mcu_ConsolePrint__M
#include "../../local.mcu/ConsolePrint/ConsolePrint.h"
#endif

#ifndef local_parts_ColorLed__M
#define local_parts_ColorLed__M
#include "../../local.parts/ColorLed/ColorLed.h"
#endif

#ifndef pollen_parts_Led0__M
#define pollen_parts_Led0__M
#include "../../pollen.parts/Led0/Led0.h"
#endif

#ifndef pollen_parts_Led1__M
#define pollen_parts_Led1__M
#include "../../pollen.parts/Led1/Led1.h"
#endif

#ifndef pollen_parts_Led2__M
#define pollen_parts_Led2__M
#include "../../pollen.parts/Led2/Led2.h"
#endif

#ifndef pollen_event_Newsroom__M
#define pollen_event_Newsroom__M
#include "../../pollen.event/Newsroom/Newsroom.h"
#endif

#ifndef pollen_time_TimerManager__M
#define pollen_time_TimerManager__M
#include "../../pollen.time/TimerManager/TimerManager.h"
#endif

#ifndef localhost_Lifecycle__M
#define localhost_Lifecycle__M
#include "../../localhost/Lifecycle/Lifecycle.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */


/*
 * ======== extern definition ========
 */

extern struct localhost_Lifecycle_ localhost_Lifecycle;

/*
 * ======== struct module definition (unit Lifecycle) ========
 */

struct localhost_Lifecycle_ {
};
typedef struct localhost_Lifecycle_ localhost_Lifecycle_;

/*
 * ======== function members (unit Lifecycle) ========
 */

extern void localhost_Lifecycle_pollen__reset__E();
extern void localhost_Lifecycle_pollen__ready__E();
extern void localhost_Lifecycle_pollen__shutdown__E( uint8 id );
extern void localhost_Lifecycle_targetInit__I();


/*
 * ======== data members (unit Lifecycle) ========
 */

