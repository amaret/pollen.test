
/*
 * ======== imports ========
 */

#ifndef test64_FuncRefClass__M
#define test64_FuncRefClass__M
#include "../../test64/FuncRefClass/FuncRefClass.h"
#endif

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test64_TestFuncRefPass_pollen__reset__E();
void test64_TestFuncRefPass_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test64_TestFuncRefPass_ test64_TestFuncRefPass;

/*
 * ======== struct module definition (unit TestFuncRefPass) ========
 */

typedef void (*test64_TestFuncRefPass_HP_handler)();
struct test64_FuncRefClass;
struct test61_PrintImpl_;
struct test64_TestFuncRefPass_ {
    test64_TestFuncRefPass_HP_handler myHandler;
    struct test61_PrintImpl_ *pollenPrintProxy;
};
typedef struct test64_TestFuncRefPass_ test64_TestFuncRefPass_;

/*
 * ======== host variables (unit TestFuncRefPass) ========
 */

typedef struct test64_FuncRefClass test64_TestFuncRefPass_f__TYPE;
extern test64_TestFuncRefPass_f__TYPE test64_TestFuncRefPass_f__V;

/*
 * ======== function members (unit TestFuncRefPass) ========
 */

extern void test64_TestFuncRefPass_pollen__run__E();
extern void test64_TestFuncRefPass_foo__I();
extern void test64_TestFuncRefPass_pollen__shutdown__E( uint8 id );
extern void test64_TestFuncRefPass_targetInit__I();


/*
 * ======== data members (unit TestFuncRefPass) ========
 */

#define test64_TestFuncRefPass_myHandler__V test64_TestFuncRefPass.myHandler
#define test64_TestFuncRefPass_f__V test64_TestFuncRefPass_f
#define test64_TestFuncRefPass_pollenPrintProxy__V test64_TestFuncRefPass.pollenPrintProxy
