
/*
 * ======== imports ========
 */

#ifndef bijou_parts_LedState__M
#define bijou_parts_LedState__M
#include "../../bijou.parts/LedState/LedState.h"
#endif

#ifndef local_output_SendOsc__M
#define local_output_SendOsc__M
#include "../../local.output/SendOsc/SendOsc.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void localhost_Lifecycle_pollen__reset__E();
void localhost_Lifecycle_pollen__ready__E();
void localhost_Lifecycle_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct local_parts_ColorLed_ local_parts_ColorLed;

/*
 * ======== struct module definition (unit ColorLed) ========
 */

struct bijou_parts_LedState;
struct local_parts_ColorLed_ {
};
typedef struct local_parts_ColorLed_ local_parts_ColorLed_;

/*
 * ======== host variables (unit ColorLed) ========
 */

typedef struct bijou_parts_LedState local_parts_ColorLed_state__TYPE;
extern local_parts_ColorLed_state__TYPE local_parts_ColorLed_state__V;

/*
 * ======== function members (unit ColorLed) ========
 */

extern void local_parts_ColorLed_doSetColor__I();
extern void local_parts_ColorLed_setState__E( struct bijou_parts_LedState*  led );
extern void local_parts_ColorLed_setRGBA__E( uint8 r, uint8 g, uint8 b, uint8 a );
extern void local_parts_ColorLed_setRGB__E( uint8 r, uint8 g, uint8 b );
extern void local_parts_ColorLed_targetInit__I();
extern void local_parts_ColorLed_getRGBA__E( uint8  data[] );
extern void local_parts_ColorLed_getRGB__E( uint8  data[] );


/*
 * ======== data members (unit ColorLed) ========
 */

#define local_parts_ColorLed_state__V local_parts_ColorLed_state
