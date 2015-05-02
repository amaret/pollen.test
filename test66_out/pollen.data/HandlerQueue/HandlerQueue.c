
/*
 * ======== string literals ========
 */

static const char pollen_data_HandlerQueue__s__fileName[] = "HandlerQueue.p";
static const char pollen_data_HandlerQueue__s__0[] = "HandlerQueue";

/*
 * ======== function definitions ========
 */

bool pollen_data_HandlerQueue_HandlerQueue_add__E( pollen_data_HandlerQueue_ this, pollen_data_HandlerQueue_HandlerProtocol_handler e ) {
    if (this->length < this->capacity) {
        this->elements[(this->tail)] = (e);
        ++(this->tail);
        ++(this->length);
        if ((this->tail) == (this->capacity)) {
            (this->tail) = 0;
        }
        return(  true  );
    }
    else {
        return(  false  );
    }
}

bool pollen_data_HandlerQueue_HandlerQueue_isEmpty__E( pollen_data_HandlerQueue_ this ) {
    return(  (this->length) == 0  );
}

uint8 pollen_data_HandlerQueue_HandlerQueue_getLength__E( pollen_data_HandlerQueue_ this ) {
    return(  this->length  );
}

pollen_data_HandlerQueue_ pollen_data_HandlerQueue_HandlerQueue_new___E( pollen_data_HandlerQueue_ this ) {
    return this;
}

typedef void (*pollen_data_HandlerQueue_HandlerProtocol_handler)();
pollen_data_HandlerQueue_HandlerProtocol_handler pollen_data_HandlerQueue_HandlerQueue_remove__E( pollen_data_HandlerQueue_ this ) {
    pollen_data_HandlerQueue_HandlerProtocol_handler e;
    
    if (!pollen_data_HandlerQueue_HandlerQueue_isEmpty__E(this)) {
        (e) = this->elements[(this->head)];
        ++(this->head);
        --(this->length);
        if ((this->head) == (this->capacity)) {
            (this->head) = 0;
        }
    }
    return(  (e)  );
}

pollen_data_HandlerQueue_HandlerProtocol_handler pollen_data_HandlerQueue_HandlerQueue_peek__E( pollen_data_HandlerQueue_ this ) {
    if (!pollen_data_HandlerQueue_HandlerQueue_isEmpty__E(this)) {
        return(  (this->elements[(this->head)])  );
    }
    else {
        return(  null  );
    }
}

uint8 pollen_data_HandlerQueue_HandlerQueue_getCapacity__E( pollen_data_HandlerQueue_ this ) {
    return(  this->capacity  );
}

