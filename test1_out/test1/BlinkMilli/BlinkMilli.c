
/*
 * ======== string literals ========
 */

static const char test1_BlinkMilli__s__fileName[] = "BlinkMilli.p";
static const char test1_BlinkMilli__s__1[] = "yy";
static const char test1_BlinkMilli__s__0[] = "led";
static const char test1_BlinkMilli__s__3[] = "BlinkMilli";
static const char test1_BlinkMilli__s__2[] = "tst";

/*
 * ======== function definitions ========
 */

uint8 test1_BlinkMilli_test__I( bool f ) {
    uint8 t;
    t = (test1_BlinkMilli_hll_red__V);
    test1_BlinkMilli_put__I((test1_BlinkMilli_nonhostarr__A[(t)++]));
    (t) = (test1_BlinkMilli_tll_red__V);
    (t) = test1_BlinkMilli_led_test_led__I(test1_BlinkMilli_tll__V);
    (t) = (test1_BlinkMilli_led_foo__E(&((test1_BlinkMilli_ledArr__A[0])), (t)));
    (t) = (test1_BlinkMilli_ledArr__A[0].red);
    test1_GlobalInterrupts_enable__E();
    test1_BlinkMilli_pollen__printBool((f));
    test1_BlinkMilli_pollen__printBool(true);
	test1_BlinkMilli_pollen__printInt((int32)3);
    test1_BlinkMilli_test_str__I(test1_BlinkMilli__s__2);
    test1_BlinkMilli_test_str__I((test1_BlinkMilli_thing__V));
    return(  3  );
}

uint8 test1_BlinkMilli_led_foo__E( test1_BlinkMilli_led_ this, uint8 p ) {
    return(  2  );
}

test1_BlinkMilli_led_ test1_BlinkMilli_led_new___I( test1_BlinkMilli_led_ this ) {
    (this->red) = 3;
    return this;
}

void test1_BlinkMilli_put__I( uint8 i ) {
}

void test1_BlinkMilli_test_str__I( string x ) {
    (test1_BlinkMilli_hostVarRefdInTarget__V) = 7;
    test1_BlinkMilli_pollen__printStr((string)(x));
    return;
}

bool test1_BlinkMilli_chkArray__I( uint8 y ) {
    uint8 arr2d[8][2];
    uint8 arr[2] = { 1, 2 };
    
    {
        (arr[1]) = test1_BlinkMilli_test__I(true);
    }
}

void test1_BlinkMilli_foobar__I( uint8  p[] ) {
}

uint8 test1_BlinkMilli_led_test_led__I( test1_BlinkMilli_led_ this ) {
    (this->blue) = 2;
}

void test1_BlinkMilli_pollen__run__E() {
    bool flag;
    {
        flag = true;
        if ((flag)) {
            (flag) = false;
        }
    }
    {
        flag = false;
        if ((flag)) {
            (flag) = false;
        }
    }
}

void test1_BlinkMilli_markUsed__I() {
    test1_Cls3_Cls3_markUsed__E(&(test1_BlinkMilli_testNest__V));
    test1_Cls1_Cls1_markUsed__E(&(test1_BlinkMilli_ccc__V));
    test1_Cls2_Cls2_markUsed__E(&(test1_BlinkMilli_testcls2__V));
    test1_GlobalInterrupts_markUsed__E();
    test1_ModFix_markUsed__E();
    test1_MoreArrays_markUsed__E();
    test1_ArrayAssign_markUsed__E();
    test1_ShortClassAccessInModule_markUsed__E();
    test1_SwitchTest_switch_test__E(1);
}

void test1_BlinkMilli_targetInit__E() {
}

