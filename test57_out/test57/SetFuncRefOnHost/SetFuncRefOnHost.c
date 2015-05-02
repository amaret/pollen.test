
/*
 * ======== string literals ========
 */

static const char test57_SetFuncRefOnHost__s__fileName[] = "SetFuncRefOnHost.p";
static const char test57_SetFuncRefOnHost__s__0[] = "SetFuncRefOnHost";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 

/*
 * ======== function definitions ========
 */

void test57_SetFuncRefOnHost_setTheFuncRefOnTarg1__I( test57_SetFuncRefOnHost_HandlerP_handler h ) {
    (test57_SetFuncRefOnHost_myHandler3_Host__V) = (h);
}

void test57_SetFuncRefOnHost_setTheFuncRefOnTarg2__I( test57_SetFuncRefOnHost_HandlerP_handler h ) {
    (test57_SetFuncRefOnHost_myHandler4_Host__V) = (h);
}

void test57_SetFuncRefOnHost_setTheFuncRefOnTarg3__I( test57_SetFuncRefOnHost_HandlerP_handler h ) {
    (test57_SetFuncRefOnHost_myHandler1_Targ__V) = (h);
}

void test57_SetFuncRefOnHost_setTheFuncRefOnTarg4__I( test57_SetFuncRefOnHost_HandlerP_handler h ) {
    (test57_SetFuncRefOnHost_myHandler2_Targ__V) = (h);
}

void test57_SetFuncRefOnHost_targetTheHandler__I() {
     printf("target Handler called\n") ;

}

void test57_SetFuncRefOnHost_pollen__shutdown__E( uint8 id ) {
}

void test57_SetFuncRefOnHost_pollen__run__E() {
     printf("check myHandler1_Host\n") ;

    if ((test57_SetFuncRefOnHost_myHandler1_Host__V) != null) {
        test57_SetFuncRefOnHost_myHandler1_Host__V();
    }
     printf("check myHandler2_Host\n") ;

    if ((test57_SetFuncRefOnHost_myHandler2_Host__V) != null) {
        test57_SetFuncRefOnHost_myHandler2_Host__V();
    }
     printf("check myHandler3_Host\n") ;

    if ((test57_SetFuncRefOnHost_myHandler3_Host__V) != null) {
        test57_SetFuncRefOnHost_myHandler3_Host__V();
    }
     printf("check myHandler4_Host\n") ;

    if ((test57_SetFuncRefOnHost_myHandler4_Host__V) != null) {
        test57_SetFuncRefOnHost_myHandler4_Host__V();
    }
     printf("check myHandler1_Targ\n") ;

    if ((test57_SetFuncRefOnHost_myHandler1_Targ__V) != null) {
        test57_SetFuncRefOnHost_myHandler1_Targ__V();
    }
     printf("check myHandler2_Targ\n") ;

    if ((test57_SetFuncRefOnHost_myHandler2_Targ__V) != null) {
        test57_SetFuncRefOnHost_myHandler2_Targ__V();
    }
     printf("check myHandler3_Targ\n") ;

    if ((test57_SetFuncRefOnHost_myHandler3_Targ__V) != null) {
        test57_SetFuncRefOnHost_myHandler3_Targ__V();
    }
     printf("check myHandler4_Targ\n") ;

    if ((test57_SetFuncRefOnHost_myHandler4_Targ__V) != null) {
        test57_SetFuncRefOnHost_myHandler4_Targ__V();
    }
     exit(0) ;

}

void test57_SetFuncRefOnHost_targetInit__I() {
    test57_SetFuncRefOnHost_setTheFuncRefOnTarg2__I((test57_SetFuncRefOnHost_targetTheHandler__I));
    test57_SetFuncRefOnHost_setTheFuncRefOnTarg4__I((test57_SetFuncRefOnHost_targetTheHandler__I));
}

