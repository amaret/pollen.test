
/*
 * ======== imports ========
 */

#ifndef virtual_mcu_GlobalInterrupts__M
#define virtual_mcu_GlobalInterrupts__M
#include "../../virtual.mcu/GlobalInterrupts/GlobalInterrupts.h"
#endif

#ifndef pollen_event_Newsroom__M
#define pollen_event_Newsroom__M
#include "../../pollen.event/Newsroom/Newsroom.h"
#endif

#ifndef test_virtual_TestClass__M
#define test_virtual_TestClass__M
#include "../../test.virtual/TestClass/TestClass.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test74_Test_20_pollen__reset__E();
void test74_Test_20_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test74_Test_20_ test74_Test_20;

/*
 * ======== struct module definition (unit Test_20) ========
 */

struct test_virtual_TestClass;
struct test74_Test_20_ {
};
typedef struct test74_Test_20_ test74_Test_20_;

/*
 * ======== host variables (unit Test_20) ========
 */

typedef struct test_virtual_TestClass test74_Test_20_tc__TYPE;
extern test74_Test_20_tc__TYPE test74_Test_20_tc__V;

/*
 * ======== function members (unit Test_20) ========
 */

extern void test74_Test_20_pollen__run__E();
extern void test74_Test_20_pollen__shutdown__E( uint8 id );
extern void test74_Test_20_testHandler__I();
extern void test74_Test_20_targetInit__I();


/*
 * ======== data members (unit Test_20) ========
 */

#define test74_Test_20_tc__V test74_Test_20_tc
