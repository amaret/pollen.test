
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test82_TestProg_pollen__reset__E();
void test82_TestProg_pollen__ready__E();
void test82_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test82_ArrayReturnErr_ test82_ArrayReturnErr;

/*
 * ======== struct module definition (unit ArrayReturnErr) ========
 */

struct test82_ArrayReturnErr_ {
    uint8 * bufNoDim;
    uint8 buffer[3];
    uint8 test[5];
    uint16 errbuff[5];
    uint16 * errbuff2;
    uint8 * bufNoDimHost;
};
typedef struct test82_ArrayReturnErr_ test82_ArrayReturnErr_;

/*
 * ======== host variables (unit ArrayReturnErr) ========
 */

typedef uint8 test82_ArrayReturnErr_testHost__TYPE;
extern const test82_ArrayReturnErr_testHost__TYPE test82_ArrayReturnErr_testHost__A[];

/*
 * ======== function members (unit ArrayReturnErr) ========
 */

extern uint8 *  test82_ArrayReturnErr_bar__I();
extern void test82_ArrayReturnErr_foobar__I();
extern void test82_ArrayReturnErr_foo__E();
extern void test82_ArrayReturnErr_targetInit__I();


/*
 * ======== data members (unit ArrayReturnErr) ========
 */

#define test82_ArrayReturnErr_bufNoDim__V test82_ArrayReturnErr.bufNoDim
#define test82_ArrayReturnErr_buffer__A test82_ArrayReturnErr.buffer
#define test82_ArrayReturnErr_test__A test82_ArrayReturnErr.test
#define test82_ArrayReturnErr_errbuff__A test82_ArrayReturnErr.errbuff
#define test82_ArrayReturnErr_errbuff2__V test82_ArrayReturnErr.errbuff2
#define test82_ArrayReturnErr_bufNoDimHost__V test82_ArrayReturnErr.bufNoDimHost
