
/*
 * ======== string literals ========
 */

static const char test1_ModFix__s__fileName[] = "ModFix.p";
static const char test1_ModFix__s__0[] = "ModFix";

/*
 * ======== function definitions ========
 */

void test1_ModFix_foo__I() {
    uint8 len;
    bool f;
    uint32 i;
    len = 4;
    f = false;
    for ((i) = 0; (i) < (len); (i)++) {
        (f) = true;
    }
    for ((i) = 0; (i) < (len); (i)++) {
        (f) = true;
    }
}

void test1_ModFix_markUsed__E() {
}

void test1_ModFix_targetInit__I() {
}

