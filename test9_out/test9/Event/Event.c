
/*
 * ======== string literals ========
 */

static const char test9_Event__s__fileName[] = "Event.p";
static const char test9_Event__s__0[] = "Event";

/*
 * ======== function definitions ========
 */

uint8 test9_Event_Event_get__E( test9_Event_ this, uint8 ii ) {
    uint8 jj;
    
    return(  (jj)  );
}

void test9_Event_Event_handle__E( test9_Event_ this ) {
    if ((this->handler) != null) {
        this->handler(this);
    }
}

test9_Event_ test9_Event_Event_new___E( test9_Event_ this, test9_Event_EH_handle handler, uint8 code ) {
    this->handler = (handler);
    this->code = (code);
    return this;
}

