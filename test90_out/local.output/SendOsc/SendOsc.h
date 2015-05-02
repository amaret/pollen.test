
/*
 * ======== imports ========
 */

#ifndef pollen_text_Text__M
#define pollen_text_Text__M
#include "../../pollen.text/Text/Text.h"
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

extern struct local_output_SendOsc_ local_output_SendOsc;

/*
 * ======== struct module definition (unit SendOsc) ========
 */

struct local_output_SendOsc_ {
    string header;
    byte data[50];
};
typedef struct local_output_SendOsc_ local_output_SendOsc_;

/*
 * ======== function members (unit SendOsc) ========
 */

extern void local_output_SendOsc_sendRGB__E( uint8 r, uint8 g, uint8 b );
extern void local_output_SendOsc_sprint__I( string s, byte  data[], uint16 start );
extern void local_output_SendOsc_targetInit__I();


/*
 * ======== data members (unit SendOsc) ========
 */

#define local_output_SendOsc_header__V local_output_SendOsc.header
#define local_output_SendOsc_data__A local_output_SendOsc.data
