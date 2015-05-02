
/*
 * ======== string literals ========
 */

static const char pollen_net_transport_Buffer__s__fileName[] = "Buffer.p";
static const char pollen_net_transport_Buffer__s__0[] = "Buffer";

/*
 * ======== function definitions ========
 */

uint16 pollen_net_transport_Buffer_Buffer_getDataLength__E( pollen_net_transport_Buffer_ this ) {
    return(  this->dlen  );
}

uint16 pollen_net_transport_Buffer_Buffer_getSize__E( pollen_net_transport_Buffer_ this ) {
    return(  this->maxBufferSize  );
}

uint8 *  pollen_net_transport_Buffer_Buffer_getBuffer__E( pollen_net_transport_Buffer_ this ) {
    return(  this->buffer  );
}

void pollen_net_transport_Buffer_Buffer_setDataLength__E( pollen_net_transport_Buffer_ this, uint16 s ) {
    this->dlen = (s);
}

pollen_net_transport_Buffer_ pollen_net_transport_Buffer_Buffer_new___E( pollen_net_transport_Buffer_ this ) {
    return this;
}

