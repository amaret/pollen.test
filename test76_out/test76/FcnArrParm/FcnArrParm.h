
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test76_Test_pollen__reset__E();
void test76_Test_pollen__ready__E();
void test76_Test_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test76_FcnArrParm_ test76_FcnArrParm;

/*
 * ======== struct module definition (unit FcnArrParm) ========
 */

struct test76_FcnArrParm_ {
    uint8 * arr;
};
typedef struct test76_FcnArrParm_ test76_FcnArrParm_;

/*
 * ======== host variables (unit FcnArrParm) ========
 */

typedef uint8 test76_FcnArrParm_arrh__TYPE;
extern test76_FcnArrParm_arrh__TYPE test76_FcnArrParm_arrh__A[];

/*
 * ======== function members (unit FcnArrParm) ========
 */

extern void test76_FcnArrParm_foo__E();
extern void test76_FcnArrParm_bar_targ__E( uint8  arr[] );
extern void test76_FcnArrParm_bar_host__E( uint8  arr[] );
extern void test76_FcnArrParm_targetInit__I();


/*
 * ======== data members (unit FcnArrParm) ========
 */

#define test76_FcnArrParm_arr__V test76_FcnArrParm.arr
