
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test31_BlinkMsp430_pollen__reset__E();
void test31_BlinkMsp430_pollen__ready__E();
void test31_BlinkMsp430_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test31_BlinkMsp430_ test31_BlinkMsp430;

/*
 * ======== struct module definition (unit BlinkMsp430) ========
 */

struct test31_BlinkMsp430_ {
};
typedef struct test31_BlinkMsp430_ test31_BlinkMsp430_;

/*
 * ======== function members (unit BlinkMsp430) ========
 */

extern void test31_BlinkMsp430_delay__I( uint16 ms );
extern void test31_BlinkMsp430_pollen__run__E();
extern void test31_BlinkMsp430_targetInit__I();


/*
 * ======== data members (unit BlinkMsp430) ========
 */

