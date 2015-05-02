
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test3_PrintTest_pollen__reset__E();
void test3_PrintTest_pollen__ready__E();
void test3_PrintTest_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test3_PrintTest_ test3_PrintTest;

/*
 * ======== struct module definition (unit PrintTest) ========
 */

struct test3_PrintTest_ {
    int32 f1;
    int32 f2;
    int32 f3;
    string pollen__unitname;
};
typedef struct test3_PrintTest_ test3_PrintTest_;

/*
 * ======== host variables (unit PrintTest) ========
 */

typedef uint32 test3_PrintTest_hv__TYPE;
extern const test3_PrintTest_hv__TYPE test3_PrintTest_hv__V;

/*
 * ======== function members (unit PrintTest) ========
 */

extern void test3_PrintTest_forTest2__I();
extern void test3_PrintTest_pollen__run__E();
extern void test3_PrintTest_otherTest__I();
extern void test3_PrintTest_forTest__I();
extern void test3_PrintTest_targetInit__I();
extern void test3_PrintTest_printStr__I( string str );


/*
 * ======== data members (unit PrintTest) ========
 */

#define test3_PrintTest_f1__V test3_PrintTest.f1
#define test3_PrintTest_f2__V test3_PrintTest.f2
#define test3_PrintTest_f3__V test3_PrintTest.f3
#define test3_PrintTest_pollen__unitname__V test3_PrintTest.pollen__unitname
