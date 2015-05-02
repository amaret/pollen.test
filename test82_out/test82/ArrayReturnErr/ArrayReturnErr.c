
/*
 * ======== string literals ========
 */

static const char test82_ArrayReturnErr__s__fileName[] = "ArrayReturnErr.p";
static const char test82_ArrayReturnErr__s__1[] = "\" but it will not exit host phase initialized\n";
static const char test82_ArrayReturnErr__s__0[] = "Note an array without dimension can be used at host time, eg: \"";
static const char test82_ArrayReturnErr__s__2[] = "ArrayReturnErr";

/*
 * ======== function definitions ========
 */

uint8 *  test82_ArrayReturnErr_bar__I() {
    return(  (test82_ArrayReturnErr_test__A)  );
}

void test82_ArrayReturnErr_foobar__I() {
    uint8 * bufNoDim1;
    
}

void test82_ArrayReturnErr_foo__E() {
    (test82_ArrayReturnErr_bufNoDim__V) = (uint8*) test82_ArrayReturnErr_bar__I();
    (test82_ArrayReturnErr_bufNoDim__V) = test82_ArrayReturnErr_bar__I();
    (test82_ArrayReturnErr_errbuff__A) = (uint16*) test82_ArrayReturnErr_bar__I();
    (test82_ArrayReturnErr_errbuff2__V) = (uint16*) test82_ArrayReturnErr_bar__I();
    (test82_ArrayReturnErr_buffer__A) = test82_ArrayReturnErr_bar__I();
}

void test82_ArrayReturnErr_targetInit__I() {
}

