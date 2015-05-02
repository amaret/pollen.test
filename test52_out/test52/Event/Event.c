
/*
 * ======== string literals ========
 */

static const char test52_Event__s__fileName[] = "Event.p";
static const char test52_Event__s__0[] = "Event";

/*
 * ======== function definitions ========
 */

uint8 test52_Event_Event_get__E( test52_Event_ this, uint8 ii ) {
    uint8 jj;
    
    return(  (jj)  );
}

void test52_Event_Event_handle__E( test52_Event_ this ) {
    if ((this->handler) != null) {
        this->handler(3);
    }
}

test52_Event_ test52_Event_Event_new___E( test52_Event_ this, test52_Event_EH_handle handler, uint8 code ) {
    this->handler = (handler);
    this->code = (code);
    return this;
}

