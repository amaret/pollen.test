
/*
 * ======== string literals ========
 */

static const char test117_ArrayReturn__s__fileName[] = "ArrayReturn.p";
static const char test117_ArrayReturn__s__3[] = "foofoo2() returns ";
static const char test117_ArrayReturn__s__4[] = "ArrayReturn";
static const char test117_ArrayReturn__s__1[] = "foofoo1() returns ";
static const char test117_ArrayReturn__s__0[] = "Cls1";
static const char test117_ArrayReturn__s__2[] = "\n";

/*
 * ======== function definitions ========
 */

test117_ArrayReturn_Cls1_  test117_ArrayReturn_foofoo1__I() {
    return*(  (test117_ArrayReturn_arrCls1Ref__A)  );
}

void test117_ArrayReturn_bar__E() {
    uint8 i;
    (test117_ArrayReturn_arrCls1Ref__A[0]) = &(test117_ArrayReturn_arrCls1Inst__A[0]);
    i = 0;
    (i) = test117_ArrayReturn_Cls1_getcVar__I(&(test117_ArrayReturn_foofoo1__I()[0]));
    test117_TestProg_pollen__printStr((string)test117_ArrayReturn__s__1);
	test117_TestProg_pollen__printUint((uint32)(i));
	test117_TestProg_pollen__printStr((string)test117_ArrayReturn__s__2);
    (i) = test117_ArrayReturn_Cls1_getcVar__I(&(test117_ArrayReturn_foofoo2__I()[0]));
    test117_TestProg_pollen__printStr((string)test117_ArrayReturn__s__3);
	test117_TestProg_pollen__printUint((uint32)(i));
	test117_TestProg_pollen__printStr((string)test117_ArrayReturn__s__2);
}

test117_ArrayReturn_Cls1_  test117_ArrayReturn_foofoo2__I() {
    return(  (test117_ArrayReturn_arrCls1Inst__A)  );
}

uint8 test117_ArrayReturn_Cls1_getcVar__I( test117_ArrayReturn_Cls1_ this ) {
    return(  (this->cVar)  );
}

test117_ArrayReturn_Cls1_ test117_ArrayReturn_Cls1_new___E( test117_ArrayReturn_Cls1_ this ) {
    return this;
}

void test117_ArrayReturn_targetInit__I() {
}

