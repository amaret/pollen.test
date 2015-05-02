
/*
 * ======== imports ========
 */

#ifndef test60_Cpu__M
#define test60_Cpu__M
#include "../../test60/Cpu/Cpu.h"
#endif

#ifndef test60_PrintImpl__M
#define test60_PrintImpl__M
#include "../../test60/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test60_TestProg_pollen__reset__E();
void test60_TestProg_pollen__ready__E();
void test60_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test60_TestProg_ test60_TestProg;

/*
 * ======== struct module definition (unit TestProg) ========
 */

struct test60_PrintImpl_;
struct test60_TestProg_ {
    struct test60_PrintImpl_ *pollenPrintProxy;
};
typedef struct test60_TestProg_ test60_TestProg_;

/*
 * ======== host variables (unit TestProg) ========
 */

typedef uint32 test60_TestProg_test_freq__TYPE;
extern const test60_TestProg_test_freq__TYPE test60_TestProg_test_freq__V;

/*
 * ======== function members (unit TestProg) ========
 */

extern void test60_TestProg_pollen__run__E();
extern void test60_TestProg_targetInit__I();


/*
 * ======== data members (unit TestProg) ========
 */

#define test60_TestProg_pollenPrintProxy__V test60_TestProg.pollenPrintProxy
