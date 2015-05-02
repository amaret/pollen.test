
/*
 * ======== imports ========
 */

#ifndef test52_FcnImpl__M
#define test52_FcnImpl__M
#include "../../test52/FcnImpl/FcnImpl.h"
#endif

#ifndef test52_Event__M
#define test52_Event__M
#include "../../test52/Event/Event.h"
#endif

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test52_HelloWorld_pollen__reset__E();
void test52_HelloWorld_pollen__ready__E();
void test52_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test52_HelloWorld_ test52_HelloWorld;

/*
 * ======== class definition (unit HelloWorld.Inner) ========
 */

struct test52_HelloWorld_Inner {
};
typedef struct test52_HelloWorld_Inner test52_HelloWorld_Inner;
typedef struct test52_HelloWorld_Inner* test52_HelloWorld_Inner_;

/*
 * ======== struct module definition (unit HelloWorld) ========
 */

typedef uint8 (*test52_HelloWorld_FcnImpl_foo_proto)(uint8);
typedef uint8 (*test52_HelloWorld_FcnProto_foo_proto)(uint8);
typedef void (*test52_HelloWorld_Inner_foo)();
typedef void (*test52_HelloWorld_foo)(uint8);
typedef uint8 (*test52_HelloWorld_foo2)(uint8);
typedef void (*test52_HelloWorld_bar)(uint8);
typedef void (*test52_HelloWorld_bar2)(bool);
typedef void (*test52_HelloWorld_bar3)(uint32);
typedef uint8 (*test52_HelloWorld_bar4)(uint8);
typedef void (*test52_HelloWorld_bar5)(uint16);
typedef uint8 (*test52_HelloWorld_bar5_and_rtn)(uint16);
struct test52_Event;
struct test52_FcnImpl_;
struct test61_PrintImpl_;
struct test52_HelloWorld_ {
    struct test52_Event*  e1;
    struct test52_Event*  e2;
    struct test52_FcnImpl_ *fp;
    test52_HelloWorld_FcnImpl_foo_proto fp_impl;
    test52_HelloWorld_FcnProto_foo_proto proto_ref;
    test52_HelloWorld_FcnImpl_foo_proto fp_impl2;
    test52_HelloWorld_Inner_foo clsFcnRef;
    test52_HelloWorld_FcnImpl_foo_proto modFcnRef;
    test52_HelloWorld_foo foo_uint8;
    test52_HelloWorld_foo2 foo2_uint32_rtn;
    test52_HelloWorld_bar bar_uint8;
    test52_HelloWorld_bar2 bar2_bool;
    test52_HelloWorld_bar3 bar3_uint32;
    test52_HelloWorld_bar4 bar4_uint32_and_rtn;
    test52_HelloWorld_bar5 bar5_uint16;
    test52_HelloWorld_bar5_and_rtn bar5_uint16_and_rtn;
    struct test61_PrintImpl_ *pollenPrintProxy;
};
typedef struct test52_HelloWorld_ test52_HelloWorld_;

/*
 * ======== function members (unit HelloWorld) ========
 */

extern void test52_HelloWorld_Inner_foo__I( test52_HelloWorld_Inner_ this );
extern void test52_HelloWorld_foo__I( uint8 p );
extern bool test52_HelloWorld_start__I( struct test52_Event*  e );
extern void test52_HelloWorld_handle__E( uint8 id );
extern void test52_HelloWorld_fcnrefsCalls__I();
extern void test52_HelloWorld_testFcns__I();
extern test52_HelloWorld_Inner_ test52_HelloWorld_Inner_new___E( test52_HelloWorld_Inner_ this );
extern void test52_HelloWorld_bar5__I( uint16 p );
extern void test52_HelloWorld_bar3__I( uint32 p );
extern uint8 test52_HelloWorld_bar4__I( uint8 p );
extern uint8 test52_HelloWorld_bar5_and_rtn__I( uint16 p );
extern void test52_HelloWorld_bar2__I( bool p );
extern void test52_HelloWorld_bar__I( uint8 p );
extern void test52_HelloWorld_pollen__run__E();
extern void test52_HelloWorld_fcnrefsParameters__I( test52_HelloWorld_bar b1, test52_HelloWorld_bar2 b2, test52_HelloWorld_bar4 b4, test52_HelloWorld_Inner_foo cf, test52_HelloWorld_FcnImpl_foo_proto mf );
extern void test52_HelloWorld_fcnrefsAssign__I();
extern uint8 test52_HelloWorld_foo2__I( uint8 p );
extern void test52_HelloWorld_targetInit__I();


/*
 * ======== data members (unit HelloWorld) ========
 */

#define test52_HelloWorld_e1__V test52_HelloWorld.e1
#define test52_HelloWorld_e2__V test52_HelloWorld.e2
#define test52_HelloWorld_fp__V test52_HelloWorld.fp
#define test52_HelloWorld_fp_impl__V test52_HelloWorld.fp_impl
#define test52_HelloWorld_proto_ref__V test52_HelloWorld.proto_ref
#define test52_HelloWorld_fp_impl2__V test52_HelloWorld.fp_impl2
#define test52_HelloWorld_clsFcnRef__V test52_HelloWorld.clsFcnRef
#define test52_HelloWorld_modFcnRef__V test52_HelloWorld.modFcnRef
#define test52_HelloWorld_foo_uint8__V test52_HelloWorld.foo_uint8
#define test52_HelloWorld_foo2_uint32_rtn__V test52_HelloWorld.foo2_uint32_rtn
#define test52_HelloWorld_bar_uint8__V test52_HelloWorld.bar_uint8
#define test52_HelloWorld_bar2_bool__V test52_HelloWorld.bar2_bool
#define test52_HelloWorld_bar3_uint32__V test52_HelloWorld.bar3_uint32
#define test52_HelloWorld_bar4_uint32_and_rtn__V test52_HelloWorld.bar4_uint32_and_rtn
#define test52_HelloWorld_bar5_uint16__V test52_HelloWorld.bar5_uint16
#define test52_HelloWorld_bar5_uint16_and_rtn__V test52_HelloWorld.bar5_uint16_and_rtn
#define test52_HelloWorld_pollenPrintProxy__V test52_HelloWorld.pollenPrintProxy
