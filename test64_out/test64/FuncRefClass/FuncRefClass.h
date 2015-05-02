
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test64_TestFuncRefPass_pollen__reset__E();
void test64_TestFuncRefPass_pollen__ready__E();
void test64_TestFuncRefPass_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit FuncRefClass) ========
 */

typedef void (*test64_FuncRefClass_HP_handler)();
struct test64_FuncRefClass {
    test64_FuncRefClass_HP_handler myHandler;
};
typedef struct test64_FuncRefClass test64_FuncRefClass;
typedef struct test64_FuncRefClass* test64_FuncRefClass_;


/*
 * ======== function members (unit FuncRefClass) ========
 */

extern void test64_FuncRefClass_FuncRefClass_test__E( test64_FuncRefClass_ this );
extern test64_FuncRefClass_ test64_FuncRefClass_FuncRefClass_new___E( test64_FuncRefClass_ this );

