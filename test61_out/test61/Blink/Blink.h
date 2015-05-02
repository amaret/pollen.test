
/*
 * ======== imports ========
 */

#ifndef test61_AvrPin__M
#define test61_AvrPin__M
#include "../../test61/AvrPin/AvrPin.h"
#endif

#ifndef test61_Led__M
#define test61_Led__M
#include "../../test61/Led/Led.h"
#endif

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test61_Blink_pollen__reset__E();
void test61_Blink_pollen__ready__E();
void test61_Blink_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test61_Blink_ test61_Blink;

/*
 * ======== struct module definition (unit Blink) ========
 */

struct test61_PrintImpl_;
struct test61_Blink_ {
    struct test61_PrintImpl_ *pollenPrintProxy;
};
typedef struct test61_Blink_ test61_Blink_;

/*
 * ======== function members (unit Blink) ========
 */

extern void test61_Blink_delay__I( uint16 ms );
extern void test61_Blink_pollen__run__E();
extern void test61_Blink_targetInit__I();


/*
 * ======== data members (unit Blink) ========
 */

#define test61_Blink_pollenPrintProxy__V test61_Blink.pollenPrintProxy
