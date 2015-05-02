
/*
 * ======== imports ========
 */

#ifndef test78_FakePin__M
#define test78_FakePin__M
#include "../../test78/FakePin/FakePin.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test78_HostCallThruProtoBug_pollen__reset__E();
void test78_HostCallThruProtoBug_pollen__ready__E();
void test78_HostCallThruProtoBug_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test78_FakeLed_ test78_FakeLed;

/*
 * ======== struct module definition (unit FakeLed) ========
 */

struct test78_FakePin_;
struct test78_FakeLed_ {
    struct test78_FakePin_ *pin;
};
typedef struct test78_FakeLed_ test78_FakeLed_;

/*
 * ======== function members (unit FakeLed) ========
 */

extern void test78_FakeLed_targetInit__I();


/*
 * ======== data members (unit FakeLed) ========
 */

#define test78_FakeLed_pin__V test78_FakeLed.pin
