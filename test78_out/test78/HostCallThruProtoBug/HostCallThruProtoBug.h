
/*
 * ======== imports ========
 */

#ifndef test78_FakePin__M
#define test78_FakePin__M
#include "../../test78/FakePin/FakePin.h"
#endif

#ifndef test78_FakeLed__M
#define test78_FakeLed__M
#include "../../test78/FakeLed/FakeLed.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test78_HostCallThruProtoBug_pollen__reset__E();
void test78_HostCallThruProtoBug_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test78_HostCallThruProtoBug_ test78_HostCallThruProtoBug;

/*
 * ======== struct module definition (unit HostCallThruProtoBug) ========
 */

struct test54_PrintImpl_;
struct test78_HostCallThruProtoBug_ {
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test78_HostCallThruProtoBug_ test78_HostCallThruProtoBug_;

/*
 * ======== function members (unit HostCallThruProtoBug) ========
 */

extern void test78_HostCallThruProtoBug_pollen__run__E();
extern void test78_HostCallThruProtoBug_pollen__shutdown__E( uint8 id );
extern void test78_HostCallThruProtoBug_targetInit__I();


/*
 * ======== data members (unit HostCallThruProtoBug) ========
 */

#define test78_HostCallThruProtoBug_pollenPrintProxy__V test78_HostCallThruProtoBug.pollenPrintProxy
