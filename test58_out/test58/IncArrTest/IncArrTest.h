
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test58_OrderOfOp_pollen__reset__E();
void test58_OrderOfOp_pollen__ready__E();
void test58_OrderOfOp_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test58_IncArrTest_ test58_IncArrTest;

/*
 * ======== struct module definition (unit IncArrTest) ========
 */

struct test58_IncArrTest_ {
    uint8 arr[1];
};
typedef struct test58_IncArrTest_ test58_IncArrTest_;

/*
 * ======== function members (unit IncArrTest) ========
 */

extern void test58_IncArrTest_foo__E();
extern void test58_IncArrTest_targetInit__I();


/*
 * ======== data members (unit IncArrTest) ========
 */

#define test58_IncArrTest_arr__A test58_IncArrTest.arr
