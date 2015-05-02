
/*
 * ======== imports ========
 */

#ifndef pollen_net_transport_BufferManager__M
#define pollen_net_transport_BufferManager__M
#include "../../pollen.net.transport/BufferManager/BufferManager.h"
#endif

#ifndef pollen_net_transport_SingleBufferManager__M
#define pollen_net_transport_SingleBufferManager__M
#include "../../pollen.net.transport/SingleBufferManager/SingleBufferManager.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test51_BufferTest_pollen__reset__E();
void test51_BufferTest_pollen__ready__E();
void test51_BufferTest_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test51_BufferTest_ test51_BufferTest;

/*
 * ======== struct module definition (unit BufferTest) ========
 */

struct test51_BufferTest_ {
    uint8 buf2[1];
};
typedef struct test51_BufferTest_ test51_BufferTest_;

/*
 * ======== function members (unit BufferTest) ========
 */

extern void test51_BufferTest_pollen__run__E();
extern void test51_BufferTest_targetInit__I();


/*
 * ======== data members (unit BufferTest) ========
 */

#define test51_BufferTest_buf2__A test51_BufferTest.buf2
