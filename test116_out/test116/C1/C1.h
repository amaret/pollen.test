
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test116_ArrayInitBug_pollen__reset__E();
void test116_ArrayInitBug_pollen__ready__E();
void test116_ArrayInitBug_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit C1) ========
 */

struct test116_C1 {
    uint8 c;
};
typedef struct test116_C1 test116_C1;
typedef struct test116_C1* test116_C1_;


/*
 * ======== function members (unit C1) ========
 */

extern void test116_C1_C1_set__E( test116_C1_ this, uint8 x );
extern uint8 test116_C1_C1_get__E( test116_C1_ this );
extern test116_C1_ test116_C1_C1_new___E( test116_C1_ this, uint8 x );

