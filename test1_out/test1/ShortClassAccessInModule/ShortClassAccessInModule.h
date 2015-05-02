
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test1_BlinkMilli_pollen__reset__E();
void test1_BlinkMilli_pollen__ready__E();
void test1_BlinkMilli_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test1_ShortClassAccessInModule_ test1_ShortClassAccessInModule;

/*
 * ======== class definition (unit ShortClassAccessInModule.Foo) ========
 */

struct test1_ShortClassAccessInModule_Foo {
    uint8 data;
};
typedef struct test1_ShortClassAccessInModule_Foo test1_ShortClassAccessInModule_Foo;
typedef struct test1_ShortClassAccessInModule_Foo* test1_ShortClassAccessInModule_Foo_;

/*
 * ======== struct module definition (unit ShortClassAccessInModule) ========
 */

struct test1_ShortClassAccessInModule_ {
};
typedef struct test1_ShortClassAccessInModule_ test1_ShortClassAccessInModule_;

/*
 * ======== function members (unit ShortClassAccessInModule) ========
 */

extern void test1_ShortClassAccessInModule_markUsed__E();
extern test1_ShortClassAccessInModule_Foo_ test1_ShortClassAccessInModule_Foo_new___E( test1_ShortClassAccessInModule_Foo_ this );
extern void test1_ShortClassAccessInModule_targetInit__I();
extern uint8 test1_ShortClassAccessInModule_Foo_getData__E( test1_ShortClassAccessInModule_Foo_ this );


/*
 * ======== data members (unit ShortClassAccessInModule) ========
 */

