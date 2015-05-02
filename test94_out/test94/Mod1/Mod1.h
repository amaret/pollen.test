
/*
 * ======== imports ========
 */

#ifndef pollen_math_Absolute__M
#define pollen_math_Absolute__M
#include "../../pollen.math/Absolute/Absolute.h"
#endif

#ifndef pollen_math_FloorCeil__M
#define pollen_math_FloorCeil__M
#include "../../pollen.math/FloorCeil/FloorCeil.h"
#endif

#ifndef pollen_math_Random8__M
#define pollen_math_Random8__M
#include "../../pollen.math/Random8/Random8.h"
#endif

#ifndef pollen_math_Random16__M
#define pollen_math_Random16__M
#include "../../pollen.math/Random16/Random16.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test94_Mod1_pollen__reset__E();
void test94_Mod1_pollen__ready__E();
void test94_Mod1_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test94_Mod1_ test94_Mod1;

/*
 * ======== struct module definition (unit Mod1) ========
 */

struct test54_PrintImpl_;
struct test94_Mod1_ {
    int8 i8;
    int16 i16;
    int32 i32;
    float f1;
    float f2;
    float f3;
    float f4;
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test94_Mod1_ test94_Mod1_;

/*
 * ======== function members (unit Mod1) ========
 */

extern void test94_Mod1_pollen__run__E();
extern void test94_Mod1_targetInit__I();


/*
 * ======== data members (unit Mod1) ========
 */

#define test94_Mod1_i8__V test94_Mod1.i8
#define test94_Mod1_i16__V test94_Mod1.i16
#define test94_Mod1_i32__V test94_Mod1.i32
#define test94_Mod1_f1__V test94_Mod1.f1
#define test94_Mod1_f2__V test94_Mod1.f2
#define test94_Mod1_f3__V test94_Mod1.f3
#define test94_Mod1_f4__V test94_Mod1.f4
#define test94_Mod1_pollenPrintProxy__V test94_Mod1.pollenPrintProxy
