
/*
 * ======== string literals ========
 */

static const char test13_Event__s__fileName[] = "Event.p";
static const char test13_Event__s__0[] = "Event";

/*
 * ======== function definitions ========
 */

test13_Event_ test13_Event_Event_get__E( test13_Event_ this, uint8 ii ) {
    uint8 jj;
    bool flag;
    
    flag = (test13_Event_X);
    return(  (this)  );
}

void test13_Event_Event_handle__E( test13_Event_ this, test13_Event_ e ) {
    if ((this->handler) != null) {
        this->handler(this);
    }
}

test13_Event_ test13_Event_Event_new___E( test13_Event_ this, test13_Event_EH_handle handler, uint8 code ) {
    this->handler = (handler);
    this->code = (code);
    return this;
}

