
/*
 * ======== string literals ========
 */

static const char test95_Arr__s__fileName[] = "Arr.p";
static const char test95_Arr__s__0[] = "Cls";
static const char test95_Arr__s__4[] = "Arr: clsVar in hostBuff ";
static const char test95_Arr__s__1[] = "Arr: sizeHost ";
static const char test95_Arr__s__5[] = "Arr";
static const char test95_Arr__s__2[] = "\n";
static const char test95_Arr__s__3[] = "Arr: clsVar ";

/*
 * ======== function definitions ========
 */

test95_Arr_Cls_ test95_Arr_Cls_new___E( test95_Arr_Cls_ this ) {
    return this;
}

uint8 test95_Arr_Cls_getClsVar__E( test95_Arr_Cls_ this ) {
    return(  (this->clsV)  );
}

void test95_Arr_targetInit__I() {
}

void test95_Arr_checkAccess__E() {
    uint8 i;
    test95_Arr_Cls_ c;
    test95_Test_pollen__printStr((string)test95_Arr__s__1);
	test95_Test_pollen__printUint((uint32)(test95_Arr_sizeHost__V));
	test95_Test_pollen__printStr((string)test95_Arr__s__2);
    i = test95_Arr_Cls_getClsVar__E(&(test95_Arr_clsVar__V));
    test95_Test_pollen__printStr((string)test95_Arr__s__3);
	test95_Test_pollen__printUint((uint32)(i));
	test95_Test_pollen__printStr((string)test95_Arr__s__2);
    
    (c) = &(test95_Arr_hostBuff_clsObj__A[1]);
    (i) = test95_Arr_Cls_getClsVar__E(c);
    test95_Test_pollen__printStr((string)test95_Arr__s__4);
	test95_Test_pollen__printUint((uint32)(i));
	test95_Test_pollen__printStr((string)test95_Arr__s__2);
}

