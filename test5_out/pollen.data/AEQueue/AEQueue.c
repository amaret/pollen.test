
/*
 * ======== string literals ========
 */

static const char pollen_data_AEQueue__s__fileName[] = "AEQueue.p";
static const char pollen_data_AEQueue__s__0[] = "AEQueue";

/*
 * ======== function definitions ========
 */

bool pollen_data_AEQueue_AEQueue_enqueue__E( pollen_data_AEQueue_ this, uint8 t ) {
    if ((this->num) < (this->capacity)) {
        (this->elements[(this->tail)]) = (t);
        (this->num)++;
        (this->tail)++;
        if ((this->tail) == (this->capacity)) {
            (this->tail) = 0;
        }
        return(  true  );
    }
    else {
        return(  false  );
    }
}

uint8 pollen_data_AEQueue_AEQueue_dequeue__E( pollen_data_AEQueue_ this ) {
    uint8 t;
    t = 0;
    if ((this->num) > 0) {
        (t) = (this->elements[(this->head)]);
        (this->head)++;
        if ((this->head) == (this->capacity)) {
            (this->head) = 0;
        }
        (this->num)--;
    }
    return(  (t)  );
}

uint8 pollen_data_AEQueue_AEQueue_length__E( pollen_data_AEQueue_ this ) {
    return(  (this->num)  );
}

pollen_data_AEQueue_ pollen_data_AEQueue_AEQueue_new___E( pollen_data_AEQueue_ this ) {
    return this;
}

uint8 pollen_data_AEQueue_AEQueue_getCapacity__E( pollen_data_AEQueue_ this ) {
    return(  (this->capacity)  );
}

