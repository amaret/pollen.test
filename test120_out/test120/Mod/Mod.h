
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

void test120_Mod_pollen__reset__E();
void test120_Mod_pollen__ready__E();
void test120_Mod_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test120_Mod_ test120_Mod;

/*
 * ======== struct module definition (unit Mod) ========
 */

struct test54_PrintImpl_;
struct test120_Mod_ {
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test120_Mod_ test120_Mod_;

/*
 * ======== function members (unit Mod) ========
 */

extern void test120_Mod_bar__I();
extern void test120_Mod_foo__I();
extern void test120_Mod_targetInit__I();


/*
 * ======== data members (unit Mod) ========
 */

#define test120_Mod_pollenPrintProxy__V test120_Mod.pollenPrintProxy
