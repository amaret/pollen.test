
/*
 * ======== string literals ========
 */

static const char test116_ArrayInitBug__s__fileName[] = "ArrayInitBug.p";
static const char test116_ArrayInitBug__s__0[] = "ArrayInitBug";

/*
 * ======== function definitions ========
 */

void test116_ArrayInitBug_test__I( struct test116_C1*  c ) {
    test116_C1_C1_get__E(c);
}

void test116_ArrayInitBug_pollen__run__E() {
    test116_C1_ c;
    c = &(test116_ArrayInitBug_array__A[0]);
    (c) = &(test116_ArrayInitBug_array__A[0]);
    test116_ArrayInitBug_test__I((c));
    test116_ArrayInitBug_test__I(&((test116_ArrayInitBug_array__A[(test116_ArrayInitBug_Pos_Zero)])));
    test116_ArrayInitBug_test__I(&((test116_ArrayInitBug_array__A[0])));
}

void test116_ArrayInitBug_pollen__shutdown__E( uint8 id ) {
}

void test116_ArrayInitBug_targetInit__I() {
}

