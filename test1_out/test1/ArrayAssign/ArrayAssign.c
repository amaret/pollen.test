
/*
 * ======== string literals ========
 */

static const char test1_ArrayAssign__s__fileName[] = "ArrayAssign.p";
static const char test1_ArrayAssign__s__0[] = "ArrayAssign";

/*
 * ======== function definitions ========
 */

void test1_ArrayAssign_bar__I() {
    byte test[5] = { 1, 2, 3, 4, 5 };
    test1_ArrayAssign_foo__I((test), 5);
}

void test1_ArrayAssign_pollen__run__E() {
}

void test1_ArrayAssign_foo__I( byte  data[], uint8 length ) {
    uint8 i;
    for (i = 0; (i) < (length); (i)++) {
        (test1_ArrayAssign_buffer__A[(i)]) = (data[(i)]);
    }
}

void test1_ArrayAssign_markUsed__E() {
}

void test1_ArrayAssign_targetInit__I() {
}

