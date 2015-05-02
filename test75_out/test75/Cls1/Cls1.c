
/*
 * ======== string literals ========
 */

static const char test75_Cls1__s__fileName[] = "Cls1.p";
static const char test75_Cls1__s__0[] = "\n";
static const char test75_Cls1__s__1[] = "Cls1";

/*
 * ======== function definitions ========
 */

bool test75_Cls1_Cls1_returnBool__E( test75_Cls1_ this ) {
    return(  false  );
}

void test75_Cls1_Cls1_test__E( test75_Cls1_ this, string s ) {
    test75_Test_pollen__printStr((string)(s));
	test75_Test_pollen__printStr((string)test75_Cls1__s__0);
}

uint8 test75_Cls1_Cls1_returnUint8__E( test75_Cls1_ this ) {
    return(  99  );
}

test75_Cls1_ test75_Cls1_Cls1_returnMe__E( test75_Cls1_ this ) {
    return(  this  );
}

test75_Cls1_ test75_Cls1_Cls1_new___E( test75_Cls1_ this ) {
    return this;
}

uint8 test75_Cls1_Cls1_returnFld__E( test75_Cls1_ this, test75_Cls1_ arg ) {
    return(  (arg->fld)  );
}

