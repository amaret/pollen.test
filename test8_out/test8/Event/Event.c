
/*
 * ======== string literals ========
 */

static const char test8_Event__s__fileName[] = "Event.p";
static const char test8_Event__s__0[] = "Event";

/*
 * ======== function definitions ========
 */

uint8 test8_Event_Event_get__E( test8_Event_ this, uint8 ii ) {
    uint8 jj;
    
    return(  (jj)  );
}

void test8_Event_Event_handle__E( test8_Event_ this, uint8 p ) {
    string n;
    n = (this->pollen__unitname);
    if ((this->handler) != null) {
        this->handler((p));
    }
}

test8_Event_ test8_Event_Event_new___E( test8_Event_ this, test8_Event_EH_handle handler, uint8 code ) {
    this->handler = (handler);
    this->code = (code);
    return this;
}

uint8 test8_Event_Event_getCode__E( test8_Event_ this ) {
    if ((this->code) == 0) {
        return(  (this->code)  );
    }
    else {
        return(  1  );
    }
}

