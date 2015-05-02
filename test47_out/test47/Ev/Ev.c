
/*
 * ======== string literals ========
 */

static const char test47_Ev__s__fileName[] = "Ev.p";
static const char test47_Ev__s__0[] = "Ev";

/*
 * ======== function definitions ========
 */

void test47_Ev_Ev_setHandler__E( test47_Ev_ this, test47_Ev_EH_handle handler ) {
    this->handler = (handler);
}

void test47_Ev_Ev_setData__E( test47_Ev_ this, uint8 data ) {
    this->data = (data);
}

uint8 test47_Ev_Ev_getPriority__E( test47_Ev_ this ) {
    return(  (this->priority)  );
}

void test47_Ev_Ev_handle__E( test47_Ev_ this, uint8 data ) {
    if ((this->handler) != null) {
        this->handler((data));
    }
}

test47_Ev_EH_handle test47_Ev_Ev_getHandler__E( test47_Ev_ this ) {
    return(  this->handler  );
}

test47_Ev_ test47_Ev_Ev_new___E( test47_Ev_ this ) {
    return this;
}

void test47_Ev_Ev_setPriority__E( test47_Ev_ this, uint8 priority ) {
    this->priority = (priority);
}

uint8 test47_Ev_Ev_getData__E( test47_Ev_ this ) {
    return(  (this->data)  );
}

