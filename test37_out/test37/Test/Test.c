
/*
 * ======== string literals ========
 */

static const char test37_Test__s__fileName[] = "Test.p";
static const char test37_Test__s__0[] = "Test";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 

/*
 * ======== function definitions ========
 */

void test37_Test_pollen__run__E() {
    test37_Mod_foo__E();
     printf("run\n") ;

}

void test37_Test_pollen__shutdown__E( uint8 id ) {
      printf("shutdown\n") ;

}

void test37_Test_targetInit__I() {
     printf("Test init\n") ;

}

