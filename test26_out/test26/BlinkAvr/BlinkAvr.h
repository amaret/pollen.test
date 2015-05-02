
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test26_BlinkAvr_pollen__reset__E();
void test26_BlinkAvr_pollen__ready__E();
void test26_BlinkAvr_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test26_BlinkAvr_ test26_BlinkAvr;

/*
 * ======== struct module definition (unit BlinkAvr) ========
 */

struct test26_BlinkAvr_ {
};
typedef struct test26_BlinkAvr_ test26_BlinkAvr_;

/*
 * ======== function members (unit BlinkAvr) ========
 */

extern void test26_BlinkAvr_delay__I( uint16 ms );
extern void test26_BlinkAvr_pollen__run__E();
extern void test26_BlinkAvr_targetInit__I();


/*
 * ======== data members (unit BlinkAvr) ========
 */

