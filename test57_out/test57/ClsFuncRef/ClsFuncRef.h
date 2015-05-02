
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test57_SetFuncRefOnHost_pollen__reset__E();
void test57_SetFuncRefOnHost_pollen__ready__E();
void test57_SetFuncRefOnHost_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit ClsFuncRef) ========
 */

typedef void (*test57_ClsFuncRef_HandlerP_handler)();
typedef void (*test57_ClsFuncRef_ClsFuncRef_foo)();
struct test57_ClsFuncRef {
;
    test57_ClsFuncRef_HandlerP_handler myHandler1_Host;
    test57_ClsFuncRef_HandlerP_handler myHandler2_Host;
    test57_ClsFuncRef_HandlerP_handler myHandler3_Host;
    test57_ClsFuncRef_HandlerP_handler myHandler4_Host;
    bool flag;
    test57_ClsFuncRef_HandlerP_handler myHandler1_Targ;
    test57_ClsFuncRef_HandlerP_handler myHandler2_Targ;
    test57_ClsFuncRef_HandlerP_handler myHandler3_Targ;
    test57_ClsFuncRef_HandlerP_handler myHandler4_Targ;
    bool flag2;
    test57_ClsFuncRef_ClsFuncRef_foo tt;
};
typedef struct test57_ClsFuncRef test57_ClsFuncRef;
typedef struct test57_ClsFuncRef* test57_ClsFuncRef_;


/*
 * ======== function members (unit ClsFuncRef) ========
 */

extern void test57_ClsFuncRef_ClsFuncRef_setTheFuncRefOnTarg1__I( test57_ClsFuncRef_ this, test57_ClsFuncRef_HandlerP_handler h );
extern void test57_ClsFuncRef_ClsFuncRef_setTheFuncRefOnTarg2__I( test57_ClsFuncRef_ this, test57_ClsFuncRef_HandlerP_handler h );
extern void test57_ClsFuncRef_ClsFuncRef_setTheFuncRefOnTarg3__I( test57_ClsFuncRef_ this, test57_ClsFuncRef_HandlerP_handler h );
extern void test57_ClsFuncRef_ClsFuncRef_setTheFuncRefOnTarg4__I( test57_ClsFuncRef_ this, test57_ClsFuncRef_HandlerP_handler h );
extern void test57_ClsFuncRef_ClsFuncRef_targetTheHandler__I( test57_ClsFuncRef_ this );
extern void test57_ClsFuncRef_ClsFuncRef_foo__E( test57_ClsFuncRef_ this );
extern test57_ClsFuncRef_ test57_ClsFuncRef_ClsFuncRef_new___E( test57_ClsFuncRef_ this );
extern void test57_ClsFuncRef_ClsFuncRef_setup__I( test57_ClsFuncRef_ this );

