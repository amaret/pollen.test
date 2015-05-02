
/*
 * ======== imports ========
 */

#ifndef pollen_net_transport_Buffer__M
#define pollen_net_transport_Buffer__M
#include "../../pollen.net.transport/Buffer/Buffer.h"
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

extern struct pollen_net_transport_SingleBufferManager_ pollen_net_transport_SingleBufferManager;

/*
 * ======== struct module definition (unit SingleBufferManager) ========
 */

struct pollen_net_transport_Buffer;
struct pollen_net_transport_SingleBufferManager_ {
    bool bufUsed;
};
typedef struct pollen_net_transport_SingleBufferManager_ pollen_net_transport_SingleBufferManager_;

/*
 * ======== host variables (unit SingleBufferManager) ========
 */

typedef struct pollen_net_transport_Buffer pollen_net_transport_SingleBufferManager_buf2__TYPE;
extern pollen_net_transport_SingleBufferManager_buf2__TYPE pollen_net_transport_SingleBufferManager_buf2__V;
typedef struct pollen_net_transport_Buffer pollen_net_transport_SingleBufferManager_buf__TYPE;
extern pollen_net_transport_SingleBufferManager_buf__TYPE pollen_net_transport_SingleBufferManager_buf__V;

/*
 * ======== function members (unit SingleBufferManager) ========
 */

extern uint16 pollen_net_transport_SingleBufferManager_getDataLength__E();
extern uint16 pollen_net_transport_SingleBufferManager_getSize__E();
extern bool pollen_net_transport_SingleBufferManager_hasEmptyBuffer__E();
extern uint8 *  pollen_net_transport_SingleBufferManager_getBuffer__E();
extern void pollen_net_transport_SingleBufferManager_freeBuffer__E();
extern uint8 *  pollen_net_transport_SingleBufferManager_getEmptyBuffer__E();
extern void pollen_net_transport_SingleBufferManager_setDataLength__E( uint16 s );
extern void pollen_net_transport_SingleBufferManager_targetInit__I();


/*
 * ======== data members (unit SingleBufferManager) ========
 */

#define pollen_net_transport_SingleBufferManager_buf2__V pollen_net_transport_SingleBufferManager_buf2
#define pollen_net_transport_SingleBufferManager_buf__V pollen_net_transport_SingleBufferManager_buf
#define pollen_net_transport_SingleBufferManager_bufUsed__V pollen_net_transport_SingleBufferManager.bufUsed
