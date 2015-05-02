
/*
 * ======== string literals ========
 */

static const char pollen_net_transport_BufferManager__s__fileName[] = "BufferManager.p";
static const char pollen_net_transport_BufferManager__s__0[] = "BufferManager";

/*
 * ======== function definitions ========
 */

uint16 pollen_net_transport_BufferManager_getDataLength__E() {
    return(  pollen_net_transport_SingleBufferManager_getDataLength__E()  );
}

uint16 pollen_net_transport_BufferManager_getSize__E() {
    return(  pollen_net_transport_SingleBufferManager_getSize__E()  );
}

bool pollen_net_transport_BufferManager_hasEmptyBuffer__E() {
    return(  pollen_net_transport_SingleBufferManager_hasEmptyBuffer__E()  );
}

uint8 *  pollen_net_transport_BufferManager_getBuffer__E() {
    return(  pollen_net_transport_SingleBufferManager_getBuffer__E()  );
}

void pollen_net_transport_BufferManager_freeBuffer__E() {
    pollen_net_transport_SingleBufferManager_freeBuffer__E();
}

uint8 *  pollen_net_transport_BufferManager_getEmptyBuffer__E() {
    return(  pollen_net_transport_SingleBufferManager_getEmptyBuffer__E()  );
}

void pollen_net_transport_BufferManager_setDataLength__E( uint16 len ) {
    pollen_net_transport_SingleBufferManager_setDataLength__E((len));
}

void pollen_net_transport_BufferManager_targetInit__I() {
}

