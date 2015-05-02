
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test51_BufferTest_pollen__reset__E();
void test51_BufferTest_pollen__ready__E();
void test51_BufferTest_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct pollen_net_transport_BufferManager_ pollen_net_transport_BufferManager;

/*
 * ======== struct module definition (unit BufferManager) ========
 */

struct pollen_net_transport_SingleBufferManager_;
struct pollen_net_transport_BufferManager_ {
    struct pollen_net_transport_SingleBufferManager_ *provider;
};
typedef struct pollen_net_transport_BufferManager_ pollen_net_transport_BufferManager_;

/*
 * ======== function members (unit BufferManager) ========
 */

extern uint16 pollen_net_transport_BufferManager_getDataLength__E();
extern uint16 pollen_net_transport_BufferManager_getSize__E();
extern bool pollen_net_transport_BufferManager_hasEmptyBuffer__E();
extern uint8 *  pollen_net_transport_BufferManager_getBuffer__E();
extern void pollen_net_transport_BufferManager_freeBuffer__E();
extern uint8 *  pollen_net_transport_BufferManager_getEmptyBuffer__E();
extern void pollen_net_transport_BufferManager_setDataLength__E( uint16 len );
extern void pollen_net_transport_BufferManager_targetInit__I();


/*
 * ======== data members (unit BufferManager) ========
 */

#define pollen_net_transport_BufferManager_provider__V pollen_net_transport_BufferManager.provider
