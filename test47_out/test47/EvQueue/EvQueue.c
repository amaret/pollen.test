
/*
 * ======== string literals ========
 */

static const char test47_EvQueue__s__fileName[] = "EvQueue.p";
static const char test47_EvQueue__s__0[] = "EvQueue";

/*
 * ======== function definitions ========
 */

bool test47_EvQueue_EvQueue_add__E( test47_EvQueue_ this, struct test47_Ev*  e ) {
    if (this->length < this->capacity) {
        this->elements[(this->tail)] = *(e);
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

bool test47_EvQueue_EvQueue_isEmpty__E( test47_EvQueue_ this ) {
    return(  (this->length) == 0  );
}

uint8 test47_EvQueue_EvQueue_getLength__E( test47_EvQueue_ this ) {
    return(  this->length  );
}

test47_EvQueue_ test47_EvQueue_EvQueue_new___I( test47_EvQueue_ this ) {
    return this;
}

test47_Ev_ test47_EvQueue_EvQueue_remove__E( test47_EvQueue_ this ) {
    test47_Ev_ e;
    e = null;
    if (!test47_EvQueue_EvQueue_isEmpty__E(this)) {
        (e) = &this->elements[(this->head)];
        ++(this->head);
        --(this->length);
        if ((this->head) == (this->capacity)) {
            (this->head) = 0;
        }
    }
    return(  (e)  );
}

test47_Ev_ test47_EvQueue_EvQueue_peek__E( test47_EvQueue_ this ) {
    if (!test47_EvQueue_EvQueue_isEmpty__E(this)) {
        return&(  this->elements[(this->head)]  );
    }
}

uint8 test47_EvQueue_EvQueue_getCapacity__E( test47_EvQueue_ this ) {
    return(  this->capacity  );
}

