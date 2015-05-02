
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test40_Test0_pollen__reset__E();
void test40_Test0_pollen__ready__E();
void test40_Test0_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test40_M_ test40_M;

/*
 * ======== struct module definition (unit M) ========
 */

struct test40_M_ {
    uint8 t;
};
typedef struct test40_M_ test40_M_;

/*
 * ======== function members (unit M) ========
 */

extern uint8 test40_M_get__E();
extern void test40_M_targetInit__I();


/*
 * ======== data members (unit M) ========
 */

#define test40_M_t__V test40_M.t
