
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test81_TestProg_pollen__reset__E();
void test81_TestProg_pollen__ready__E();
void test81_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test81_ArrayReturn_ test81_ArrayReturn;

/*
 * ======== struct module definition (unit ArrayReturn) ========
 */

struct test81_ArrayReturn_ {
    uint8 * bufNoDim;
    uint8 buffer[5];
    uint8 test1[5];
    bool test2[5];
    bool buffer2[5];
};
typedef struct test81_ArrayReturn_ test81_ArrayReturn_;

/*
 * ======== function members (unit ArrayReturn) ========
 */

extern bool *  test81_ArrayReturn_bar2__I();
extern uint8 *  test81_ArrayReturn_bar__I();
extern void test81_ArrayReturn_foobar__I();
extern void test81_ArrayReturn_foo__E();
extern void test81_ArrayReturn_targetInit__I();


/*
 * ======== data members (unit ArrayReturn) ========
 */

#define test81_ArrayReturn_bufNoDim__V test81_ArrayReturn.bufNoDim
#define test81_ArrayReturn_buffer__A test81_ArrayReturn.buffer
#define test81_ArrayReturn_test1__A test81_ArrayReturn.test1
#define test81_ArrayReturn_test2__A test81_ArrayReturn.test2
#define test81_ArrayReturn_buffer2__A test81_ArrayReturn.buffer2
