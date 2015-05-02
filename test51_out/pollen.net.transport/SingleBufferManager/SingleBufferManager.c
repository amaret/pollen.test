
/*
 * ======== string literals ========
 */

static const char pollen_net_transport_SingleBufferManager__s__fileName[] = "SingleBufferManager.p";
static const char pollen_net_transport_SingleBufferManager__s__0[] = "SingleBufferManager";

/*
 * ======== function definitions ========
 */

uint16 pollen_net_transport_SingleBufferManager_getDataLength__E() {
    return(  pollen_net_transport_Buffer_Buffer_getDataLength__E(&(pollen_net_transport_SingleBufferManager_buf__V))  );
}

uint16 pollen_net_transport_SingleBufferManager_getSize__E() {
    return(  pollen_net_transport_Buffer_Buffer_getSize__E(&(pollen_net_transport_SingleBufferManager_buf__V))  );
}

bool pollen_net_transport_SingleBufferManager_hasEmptyBuffer__E() {
    return(  !(pollen_net_transport_SingleBufferManager_bufUsed__V)  );
}

uint8 *  pollen_net_transport_SingleBufferManager_getBuffer__E() {
    return(  pollen_net_transport_Buffer_Buffer_getBuffer__E(&(pollen_net_transport_SingleBufferManager_buf__V))  );
}

void pollen_net_transport_SingleBufferManager_freeBuffer__E() {
    (pollen_net_transport_SingleBufferManager_bufUsed__V) = false;
}

uint8 *  pollen_net_transport_SingleBufferManager_getEmptyBuffer__E() {
    if (!(pollen_net_transport_SingleBufferManager_bufUsed__V)) {
        (pollen_net_transport_SingleBufferManager_bufUsed__V) = true;
        return(  pollen_net_transport_SingleBufferManager_getBuffer__E()  );
    }
    else {
        return(  null  );
    }
}

void pollen_net_transport_SingleBufferManager_setDataLength__E( uint16 s ) {
    pollen_net_transport_Buffer_Buffer_setDataLength__E(&(pollen_net_transport_SingleBufferManager_buf__V), (s));
}

void pollen_net_transport_SingleBufferManager_targetInit__I() {
}

