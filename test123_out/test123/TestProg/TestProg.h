
/*
 * ======== imports ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test123_TestProg_pollen__reset__E();
void test123_TestProg_pollen__ready__E();
void test123_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test123_TestProg_ test123_TestProg;

/*
 * ======== struct module definition (unit TestProg) ========
 */

struct test54_PrintImpl_;
struct test123_TestProg_ {
    uint8 _arr_u8[4];
    uint8 * arr_u8;
    uint16 * arr_u16;
    uint32 * arr_u32;
    bool _arr_b[1];
    bool * arr_b;
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test123_TestProg_ test123_TestProg_;

/*
 * ======== function members (unit TestProg) ========
 */

extern void test123_TestProg_pollen__run__E();
extern void test123_TestProg_targetInit__I();


/*
 * ======== data members (unit TestProg) ========
 */

#define test123_TestProg__arr_u8__A test123_TestProg._arr_u8
#define test123_TestProg_arr_u8__V test123_TestProg.arr_u8
#define test123_TestProg_arr_u16__V test123_TestProg.arr_u16
#define test123_TestProg_arr_u32__V test123_TestProg.arr_u32
#define test123_TestProg__arr_b__A test123_TestProg._arr_b
#define test123_TestProg_arr_b__V test123_TestProg.arr_b
#define test123_TestProg_pollenPrintProxy__V test123_TestProg.pollenPrintProxy
