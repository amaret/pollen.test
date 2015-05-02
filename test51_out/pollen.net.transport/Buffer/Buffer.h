
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
 * ======== class definition (unit Buffer) ========
 */

struct pollen_net_transport_Buffer {
    uint16 dlen;
    uint16 maxBufferSize;
    uint8 buffer[124];
};
typedef struct pollen_net_transport_Buffer pollen_net_transport_Buffer;
typedef struct pollen_net_transport_Buffer* pollen_net_transport_Buffer_;


/*
 * ======== host variables (unit Buffer) ========
 */

typedef uint16 pollen_net_transport_Buffer_maxBufferSize__TYPE;
extern pollen_net_transport_Buffer_maxBufferSize__TYPE pollen_net_transport_Buffer_maxBufferSize__V;

/*
 * ======== function members (unit Buffer) ========
 */

extern uint16 pollen_net_transport_Buffer_Buffer_getDataLength__E( pollen_net_transport_Buffer_ this );
extern uint16 pollen_net_transport_Buffer_Buffer_getSize__E( pollen_net_transport_Buffer_ this );
extern uint8 *  pollen_net_transport_Buffer_Buffer_getBuffer__E( pollen_net_transport_Buffer_ this );
extern void pollen_net_transport_Buffer_Buffer_setDataLength__E( pollen_net_transport_Buffer_ this, uint16 s );
extern pollen_net_transport_Buffer_ pollen_net_transport_Buffer_Buffer_new___E( pollen_net_transport_Buffer_ this );

