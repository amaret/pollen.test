
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

void localhost_Lifecycle_pollen__reset__E();
void localhost_Lifecycle_pollen__ready__E();
void localhost_Lifecycle_pollen__shutdown__E(uint8 i);

/*
 * ======== enum definitions (unit LedState) ========
 */

typedef uint8 bijou_parts_LedState_Colors;
#define bijou_parts_LedState_Colors_Red 0
#define bijou_parts_LedState_Colors_Green 1
#define bijou_parts_LedState_Colors_Blue 2
#define bijou_parts_LedState_Colors_Alpha 3

/*
 * ======== class definition (unit LedState) ========
 */

struct bijou_parts_LedState {
;
    uint8 id;
    uint8 rgba[4];
};
typedef struct bijou_parts_LedState bijou_parts_LedState;
typedef struct bijou_parts_LedState* bijou_parts_LedState_;


/*
 * ======== host variables (unit LedState) ========
 */

typedef uint8 bijou_parts_LedState_id__TYPE;
extern bijou_parts_LedState_id__TYPE bijou_parts_LedState_id__V;

/*
 * ======== function members (unit LedState) ========
 */

extern void bijou_parts_LedState_LedState_apply__E( bijou_parts_LedState_ this );
extern bijou_parts_LedState_ bijou_parts_LedState_LedState_setRGB__E( bijou_parts_LedState_ this, uint8 red, uint8 green, uint8 blue );
extern bijou_parts_LedState_ bijou_parts_LedState_LedState_setAlpha__E( bijou_parts_LedState_ this, uint8 alpha );
extern uint8 bijou_parts_LedState_LedState_getId__E( bijou_parts_LedState_ this );
extern bijou_parts_LedState_ bijou_parts_LedState_LedState_new___E( bijou_parts_LedState_ this );
extern bijou_parts_LedState_ bijou_parts_LedState_LedState_setRed__E( bijou_parts_LedState_ this, uint8 red );
extern bijou_parts_LedState_ bijou_parts_LedState_LedState_setGreen__E( bijou_parts_LedState_ this, uint8 green );
extern uint8 bijou_parts_LedState_LedState_getBlue__E( bijou_parts_LedState_ this );
extern void bijou_parts_LedState_LedState_getRGBA__E( bijou_parts_LedState_ this, uint8  rgba[] );
extern uint8 bijou_parts_LedState_LedState_getAlpha__E( bijou_parts_LedState_ this );
extern uint8 bijou_parts_LedState_LedState_getRed__E( bijou_parts_LedState_ this );
extern uint8 bijou_parts_LedState_LedState_getGreen__E( bijou_parts_LedState_ this );
extern bijou_parts_LedState_ bijou_parts_LedState_LedState_setBlue__E( bijou_parts_LedState_ this, uint8 blue );
extern void bijou_parts_LedState_LedState_setId__E( bijou_parts_LedState_ this, uint8 id );
extern bijou_parts_LedState_ bijou_parts_LedState_LedState_setState__E( bijou_parts_LedState_ this, bijou_parts_LedState_ state );
extern bijou_parts_LedState_ bijou_parts_LedState_LedState_setRGBA__E( bijou_parts_LedState_ this, uint8 red, uint8 green, uint8 blue, uint8 alpha );
extern void bijou_parts_LedState_LedState_getRGB__E( bijou_parts_LedState_ this, uint8  rgb[] );

