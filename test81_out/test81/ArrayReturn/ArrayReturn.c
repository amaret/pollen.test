
/*
 * ======== string literals ========
 */

static const char test81_ArrayReturn__s__fileName[] = "ArrayReturn.p";
static const char test81_ArrayReturn__s__3[] = "PASS buffer peg to function return \n";
static const char test81_ArrayReturn__s__6[] = "FAIL buffer 0th element assigned from returned array\n";
static const char test81_ArrayReturn__s__1[] = "PASS local buffer peg to function return \n";
static const char test81_ArrayReturn__s__9[] = "PASS buffer 4th element assigned from returned array\n";
static const char test81_ArrayReturn__s__10[] = "FAIL buffer 4th element assigned from returned array\n";
static const char test81_ArrayReturn__s__0[] = "FAIL local buffer peg to function return \n";
static const char test81_ArrayReturn__s__18[] = "ArrayReturn";
static const char test81_ArrayReturn__s__15[] = "FAIL buffer2 3th element assigned from returned array\n";
static const char test81_ArrayReturn__s__17[] = "FAIL buffer2 4th element assigned from returned array\n";
static const char test81_ArrayReturn__s__11[] = "Test assigning (bool) elements from array function return:\n";
static const char test81_ArrayReturn__s__8[] = "FAIL buffer 3th element assigned from returned array\n";
static const char test81_ArrayReturn__s__4[] = "Test assigning (uint8) elements from array function return:\n";
static const char test81_ArrayReturn__s__14[] = "PASS buffer2 3th element assigned from returned array\n";
static const char test81_ArrayReturn__s__16[] = "PASS buffer2 4th element assigned from returned array\n";
static const char test81_ArrayReturn__s__12[] = "PASS buffer2 0th element assigned from returned array\n";
static const char test81_ArrayReturn__s__2[] = "FAIL buffer peg to function return \n";
static const char test81_ArrayReturn__s__7[] = "PASS buffer 3th element assigned from returned array\n";
static const char test81_ArrayReturn__s__5[] = "PASS buffer 0th element assigned from returned array\n";
static const char test81_ArrayReturn__s__13[] = "FAIL buffer2 0th element assigned from returned array\n";

/*
 * ======== function definitions ========
 */

bool *  test81_ArrayReturn_bar2__I() {
    return(  (test81_ArrayReturn_test2__A)  );
}

uint8 *  test81_ArrayReturn_bar__I() {
    return(  (test81_ArrayReturn_test1__A)  );
}

void test81_ArrayReturn_foobar__I() {
    uint8 * bufNoDim;
    bool fail;
    uint8 i;
    
    (bufNoDim) = (uint8*) test81_ArrayReturn_bar__I();
    fail = false;
    for (i = 0; (i) < 5; (i)++) {
        if ((bufNoDim[(i)]) != (test81_ArrayReturn_test1__A[(i)])) {
            (fail) = true;
        }
    }
    if ((fail)) {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__0);
    }
    else {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__1);
    }
}

void test81_ArrayReturn_foo__E() {
    bool fail;
    uint8 i;
    (test81_ArrayReturn_bufNoDim__V) = (uint8*) test81_ArrayReturn_bar__I();
    fail = false;
    for (i = 0; (i) < 5; (i)++) {
        if ((test81_ArrayReturn_bufNoDim__V[(i)]) != (test81_ArrayReturn_test1__A[(i)])) {
            (fail) = true;
        }
    }
    if ((fail)) {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__2);
    }
    else {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__3);
    }
    test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__4);
    (test81_ArrayReturn_buffer__A[0]) = test81_ArrayReturn_bar__I()[0];
    if ((test81_ArrayReturn_buffer__A[0]) == 1) {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__5);
    }
    else {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__6);
    }
    (test81_ArrayReturn_buffer__A[3]) = test81_ArrayReturn_bar__I()[3];
    if ((test81_ArrayReturn_buffer__A[3]) == 4) {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__7);
    }
    else {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__8);
    }
    (test81_ArrayReturn_buffer__A[4]) = test81_ArrayReturn_bar__I()[4];
    if ((test81_ArrayReturn_buffer__A[4]) == 5) {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__9);
    }
    else {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__10);
    }
    test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__11);
    (test81_ArrayReturn_buffer2__A[0]) = test81_ArrayReturn_bar2__I()[0];
    if ((test81_ArrayReturn_buffer2__A[0]) == true) {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__12);
    }
    else {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__13);
    }
    (test81_ArrayReturn_buffer2__A[3]) = test81_ArrayReturn_bar2__I()[3];
    if ((test81_ArrayReturn_buffer2__A[3]) == true) {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__14);
    }
    else {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__15);
    }
    (test81_ArrayReturn_buffer2__A[4]) = test81_ArrayReturn_bar2__I()[4];
    if ((test81_ArrayReturn_buffer2__A[4]) == false) {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__16);
    }
    else {
        test81_TestProg_pollen__printStr((string)test81_ArrayReturn__s__17);
    }
    test81_ArrayReturn_foobar__I();
}

void test81_ArrayReturn_targetInit__I() {
}

