
/*
 * ======== string literals ========
 */

static const char test49_Event__s__fileName[] = "Event.p";
static const char test49_Event__s__0[] = "Event";

/*
 * ======== function definitions ========
 */

void test49_Event_Event_handle__E( test49_Event_ this ) {
    if ((this->handler) != null) {
        this->handler((this->code));
    }
}

test49_Event_ test49_Event_Event_new___E( test49_Event_ this ) {
    (this->code) = 7;
    return this;
}

