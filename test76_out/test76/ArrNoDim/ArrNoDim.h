
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

extern struct test76_ArrNoDim_ test76_ArrNoDim;

/*
 * ======== struct module definition (unit ArrNoDim) ========
 */

struct test76_ArrNoDim_ {
    uint8 * arr;
};
typedef struct test76_ArrNoDim_ test76_ArrNoDim_;

/*
 * ======== host variables (unit ArrNoDim) ========
 */

typedef uint8 test76_ArrNoDim_arrh__TYPE;
extern test76_ArrNoDim_arrh__TYPE test76_ArrNoDim_arrh__A[];

/*
 * ======== function members (unit ArrNoDim) ========
 */

extern void test76_ArrNoDim_foo__E();
extern void test76_ArrNoDim_targetInit__I();


/*
 * ======== data members (unit ArrNoDim) ========
 */

#define test76_ArrNoDim_arr__V test76_ArrNoDim.arr
