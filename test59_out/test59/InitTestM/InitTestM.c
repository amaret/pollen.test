
/*
 * ======== string literals ========
 */

static const char test59_InitTestM__s__fileName[] = "InitTestM.p";
static const char test59_InitTestM__s__0[] = "InitTestM host init\n";
static const char test59_InitTestM__s__1[] = "Init order should be: \n";
static const char test59_InitTestM__s__3[] = "InitTestM";
static const char test59_InitTestM__s__2[] = "1. InitTestM2 2. InitTestC 3. InitTestM \n";

/*
 * ======== function definitions ========
 */

void test59_InitTestM_pollen__run__E() {
    test59_InitTestM2_foo__E();
}

void test59_InitTestM_pollen__shutdown__E( uint8 id ) {
}

void test59_InitTestM_targetInit__I() {
}

