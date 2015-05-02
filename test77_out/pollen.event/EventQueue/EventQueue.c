
/*
 * ======== string literals ========
 */

static const char pollen_event_EventQueue__s__fileName[] = "EventQueue.p";
static const char pollen_event_EventQueue__s__2[] = "EventQueue setting new capacity =";
static const char pollen_event_EventQueue__s__3[] = "EventQueue";
static const char pollen_event_EventQueue__s__0[] = "EventQueue created with initial capacity = ";
static const char pollen_event_EventQueue__s__1[] = "\n";

/*
 * ======== function definitions ========
 */

bool pollen_event_EventQueue_EventQueue_add__E( pollen_event_EventQueue_ this, struct pollen_event_Event*  e ) {
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

bool pollen_event_EventQueue_EventQueue_isEmpty__E( pollen_event_EventQueue_ this ) {
    return(  (this->length) == 0  );
}

uint8 pollen_event_EventQueue_EventQueue_getLength__E( pollen_event_EventQueue_ this ) {
    return(  this->length  );
}

pollen_event_EventQueue_ pollen_event_EventQueue_EventQueue_new___E( pollen_event_EventQueue_ this ) {
    return this;
}

pollen_event_Event_ pollen_event_EventQueue_EventQueue_remove__E( pollen_event_EventQueue_ this ) {
    pollen_event_Event_ e;
    e = null;
    if (this->length != 0) {
        (e) = this->elements[(this->head)];
        ++(this->head);
        --(this->length);
        if ((this->head) == (this->capacity)) {
            (this->head) = 0;
        }
    }
    return(  (e)  );
}

pollen_event_Event_ pollen_event_EventQueue_EventQueue_peek__E( pollen_event_EventQueue_ this ) {
    if (!pollen_event_EventQueue_EventQueue_isEmpty__E(this)) {
        return(  (this->elements[(this->head)])  );
    }
    else {
        return(  null  );
    }
}

uint8 pollen_event_EventQueue_EventQueue_getCapacity__E( pollen_event_EventQueue_ this ) {
    return(  this->capacity  );
}

