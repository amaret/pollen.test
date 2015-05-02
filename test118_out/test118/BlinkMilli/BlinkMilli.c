
/*
 * ======== string literals ========
 */

static const char test118_BlinkMilli__s__fileName[] = "BlinkMilli.p";
static const char test118_BlinkMilli__s__0[] = "led";
static const char test118_BlinkMilli__s__1[] = "BlinkMilli";

/*
 * ======== function definitions ========
 */

void test118_BlinkMilli_foobar__I( uint8  p[] ) {
}

uint8 test118_BlinkMilli_led_test_led__I( test118_BlinkMilli_led_ this ) {
    (this->blue) = 2;
}

uint8 test118_BlinkMilli_test__I( bool f ) {
    uint8 t;
    t = test118_BlinkMilli_led_test_led__I(&(test118_BlinkMilli_hll__V));
    (t) = (test118_BlinkMilli_led_foo__E(&((test118_BlinkMilli_ledArr__A[0])), (t)));
    (t) = (test118_BlinkMilli_ledArr__A[0].red);
    return(  3  );
}

void test118_BlinkMilli_pollen__run__E() {
}

uint8 test118_BlinkMilli_led_foo__E( test118_BlinkMilli_led_ this, uint8 p ) {
    return(  2  );
}

test118_BlinkMilli_led_ test118_BlinkMilli_led_new___I( test118_BlinkMilli_led_ this ) {
    (this->red) = 3;
    return this;
}

void test118_BlinkMilli_targetInit__E() {
}

bool test118_BlinkMilli_chkArray__I( uint8 y ) {
    uint8 arr[2] = { 1, 2 };
    {
        (arr[1]) = test118_BlinkMilli_test__I(true);
    }
}

