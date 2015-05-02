
/*
 * ======== imports ========
 */

#ifndef test1_Cls1__M
#define test1_Cls1__M
#include "../../test1/Cls1/Cls1.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test1_BlinkMilli_pollen__reset__E();
void test1_BlinkMilli_pollen__ready__E();
void test1_BlinkMilli_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test1_GlobalInterrupts_ test1_GlobalInterrupts;

/*
 * ======== struct module definition (unit GlobalInterrupts) ========
 */

struct test1_GlobalInterrupts_ {
    uint8 giVar;
};
typedef struct test1_GlobalInterrupts_ test1_GlobalInterrupts_;

/*
 * ======== host variables (unit GlobalInterrupts) ========
 */

typedef uint8 test1_GlobalInterrupts_hostVar__TYPE;
extern const test1_GlobalInterrupts_hostVar__TYPE test1_GlobalInterrupts_hostVar__V;

/*
 * ======== function members (unit GlobalInterrupts) ========
 */

extern uint16 test1_GlobalInterrupts_disable__E();
extern void test1_GlobalInterrupts_enable__E();
extern void test1_GlobalInterrupts_markUsed__E();
extern void test1_GlobalInterrupts_targetInit__I();


/*
 * ======== data members (unit GlobalInterrupts) ========
 */

#define test1_GlobalInterrupts_giVar__V test1_GlobalInterrupts.giVar
