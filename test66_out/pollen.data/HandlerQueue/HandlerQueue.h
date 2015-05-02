
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test66_Test_08_pollen__reset__E();
void test66_Test_08_pollen__ready__E();
void test66_Test_08_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit HandlerQueue) ========
 */

typedef void (*pollen_data_HandlerQueue_HandlerProtocol_handler)();
struct pollen_data_HandlerQueue {
    const uint8 capacity;
    pollen_data_HandlerQueue_HandlerProtocol_handler elements[10] /* capacity */;
    uint8 length;
    uint8 head;
    uint8 tail;
    uint8 maxLength;
};
typedef struct pollen_data_HandlerQueue pollen_data_HandlerQueue;
typedef struct pollen_data_HandlerQueue* pollen_data_HandlerQueue_;


/*
 * ======== function members (unit HandlerQueue) ========
 */

extern bool pollen_data_HandlerQueue_HandlerQueue_add__E( pollen_data_HandlerQueue_ this, pollen_data_HandlerQueue_HandlerProtocol_handler e );
extern bool pollen_data_HandlerQueue_HandlerQueue_isEmpty__E( pollen_data_HandlerQueue_ this );
extern uint8 pollen_data_HandlerQueue_HandlerQueue_getLength__E( pollen_data_HandlerQueue_ this );
extern pollen_data_HandlerQueue_ pollen_data_HandlerQueue_HandlerQueue_new___E( pollen_data_HandlerQueue_ this );
extern pollen_data_HandlerQueue_HandlerProtocol_handler pollen_data_HandlerQueue_HandlerQueue_remove__E( pollen_data_HandlerQueue_ this );
extern pollen_data_HandlerQueue_HandlerProtocol_handler pollen_data_HandlerQueue_HandlerQueue_peek__E( pollen_data_HandlerQueue_ this );
extern uint8 pollen_data_HandlerQueue_HandlerQueue_getCapacity__E( pollen_data_HandlerQueue_ this );


/*
 * ======== const definitions ========
 */

#define pollen_data_HandlerQueue_capacity (10)
