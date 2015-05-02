
/*
 * ======== string literals ========
 */

static const char test116_C1__s__fileName[] = "C1.p";
static const char test116_C1__s__0[] = "C1";

/*
 * ======== function definitions ========
 */

void test116_C1_C1_set__E( test116_C1_ this, uint8 x ) {
    (this->c) = (x);
}

uint8 test116_C1_C1_get__E( test116_C1_ this ) {
    return(  (this->c)  );
}

test116_C1_ test116_C1_C1_new___E( test116_C1_ this, uint8 x ) {
    (this->c) = (x);
    return this;
}

