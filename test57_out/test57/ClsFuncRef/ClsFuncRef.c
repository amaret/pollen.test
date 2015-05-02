
/*
 * ======== string literals ========
 */

static const char test57_ClsFuncRef__s__fileName[] = "ClsFuncRef.p";
static const char test57_ClsFuncRef__s__0[] = "ClsFuncRef";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 

/*
 * ======== function definitions ========
 */

void test57_ClsFuncRef_ClsFuncRef_setTheFuncRefOnTarg1__I( test57_ClsFuncRef_ this, test57_ClsFuncRef_HandlerP_handler h ) {
    (this->myHandler3_Host) = (h);
}

void test57_ClsFuncRef_ClsFuncRef_setTheFuncRefOnTarg2__I( test57_ClsFuncRef_ this, test57_ClsFuncRef_HandlerP_handler h ) {
    (this->myHandler4_Host) = (h);
}

void test57_ClsFuncRef_ClsFuncRef_setTheFuncRefOnTarg3__I( test57_ClsFuncRef_ this, test57_ClsFuncRef_HandlerP_handler h ) {
    (this->myHandler1_Targ) = (h);
}

void test57_ClsFuncRef_ClsFuncRef_setTheFuncRefOnTarg4__I( test57_ClsFuncRef_ this, test57_ClsFuncRef_HandlerP_handler h ) {
    (this->myHandler2_Targ) = (h);
}

void test57_ClsFuncRef_ClsFuncRef_targetTheHandler__I( test57_ClsFuncRef_ this ) {
     printf("target Handler called\n") ;

}

void test57_ClsFuncRef_ClsFuncRef_foo__E( test57_ClsFuncRef_ this ) {
    test57_ClsFuncRef_ClsFuncRef_setup__I(this);
     printf("check myHandler1_Host\n") ;

    if ((this->myHandler1_Host) != null) {
        this->myHandler1_Host();
    }
     printf("check myHandler2_Host\n") ;

    if ((this->myHandler2_Host) != null) {
        this->myHandler2_Host();
    }
     printf("check myHandler3_Host\n") ;

    if ((this->myHandler3_Host) != null) {
        this->myHandler3_Host();
    }
     printf("check myHandler4_Host\n") ;

    if ((this->myHandler4_Host) != null) {
        this->myHandler4_Host();
    }
     printf("check myHandler1_Targ\n") ;

    if ((this->myHandler1_Targ) != null) {
        this->myHandler1_Targ();
    }
     printf("check myHandler2_Targ\n") ;

    if ((this->myHandler2_Targ) != null) {
        this->myHandler2_Targ();
    }
     printf("check myHandler3_Targ\n") ;

    if ((this->myHandler3_Targ) != null) {
        this->myHandler3_Targ();
    }
     printf("check myHandler4_Targ\n") ;

    if ((this->myHandler4_Targ) != null) {
        this->myHandler4_Targ();
    }
}

test57_ClsFuncRef_ test57_ClsFuncRef_ClsFuncRef_new___E( test57_ClsFuncRef_ this ) {
    return this;
}

void test57_ClsFuncRef_ClsFuncRef_setup__I( test57_ClsFuncRef_ this ) {
    test57_ClsFuncRef_ClsFuncRef_setTheFuncRefOnTarg2__I(this, (test57_ClsFuncRef_ClsFuncRef_targetTheHandler__I));
    test57_ClsFuncRef_ClsFuncRef_setTheFuncRefOnTarg4__I(this, (test57_ClsFuncRef_ClsFuncRef_targetTheHandler__I));
}

