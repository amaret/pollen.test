
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test17_TimerManagerTest_pollen__reset__E();
void test17_TimerManagerTest_pollen__ready__E();
void test17_TimerManagerTest_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit AEQueue) ========
 */

struct pollen_data_AEQueue {
    uint8 capacity;
    uint8 elements[10];
    uint8 head;
    uint8 tail;
    uint8 num;
};
typedef struct pollen_data_AEQueue pollen_data_AEQueue;
typedef struct pollen_data_AEQueue* pollen_data_AEQueue_;


/*
 * ======== host variables (unit AEQueue) ========
 */

typedef uint8 pollen_data_AEQueue_capacity__TYPE;
extern pollen_data_AEQueue_capacity__TYPE pollen_data_AEQueue_capacity__V;

/*
 * ======== function members (unit AEQueue) ========
 */

extern bool pollen_data_AEQueue_AEQueue_enqueue__E( pollen_data_AEQueue_ this, uint8 t );
extern uint8 pollen_data_AEQueue_AEQueue_dequeue__E( pollen_data_AEQueue_ this );
extern uint8 pollen_data_AEQueue_AEQueue_length__E( pollen_data_AEQueue_ this );
extern pollen_data_AEQueue_ pollen_data_AEQueue_AEQueue_new___E( pollen_data_AEQueue_ this );
extern uint8 pollen_data_AEQueue_AEQueue_getCapacity__E( pollen_data_AEQueue_ this );


/*
 * ======== const definitions ========
 */

#define pollen_data_AEQueue_cap (10)
