
/*
 * ======== imports ========
 */

#ifndef pollen_text_Text__M
#define pollen_text_Text__M
#include "../../pollen.text/Text/Text.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test93_Mod1_pollen__reset__E();
void test93_Mod1_pollen__ready__E();
void test93_Mod1_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test93_Mod1_ test93_Mod1;

/*
 * ======== struct module definition (unit Mod1) ========
 */

struct test54_PrintImpl_;
struct test93_Mod1_ {
    string s1;
    string s2;
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test93_Mod1_ test93_Mod1_;

/*
 * ======== function members (unit Mod1) ========
 */

extern string test93_Mod1_test_strcmp__I( string s1, string s2 );
extern void test93_Mod1_pollen__run__E();
extern void test93_Mod1_test_strlen__I( string s1 );
extern string test93_Mod1_test_strncmp__I( string s1, string s2, uint16 n );
extern void test93_Mod1_targetInit__I();


/*
 * ======== data members (unit Mod1) ========
 */

#define test93_Mod1_s1__V test93_Mod1.s1
#define test93_Mod1_s2__V test93_Mod1.s2
#define test93_Mod1_pollenPrintProxy__V test93_Mod1.pollenPrintProxy
