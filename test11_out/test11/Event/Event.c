
/*
 * ======== string literals ========
 */

static const char test11_Event__s__fileName[] = "Event.p";
static const char test11_Event__s__0[] = "Event";

/*
 * ======== function definitions ========
 */

uint8 test11_Event_Event_get__E( test11_Event_ this, uint8 ii ) {
    uint8 jj;
    
    return(  (jj)  );
}

void test11_Event_Event_handle__E( test11_Event_ this ) {
    if ((this->handler) != null) {
    }
}

test11_Event_ test11_Event_Event_new___E( test11_Event_ this, test11_Event_EH_handle handler, uint8 code ) {
    this->handler = (handler);
    this->code = (code);
    return this;
}

