
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test15_Msp430g2231_pollen__reset__E();
void test15_Msp430g2231_pollen__ready__E();
void test15_Msp430g2231_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test15_Msp430g2231_ test15_Msp430g2231;

/*
 * ======== struct module definition (unit Msp430g2231) ========
 */

struct test15_Msp430g2231_ {
};
typedef struct test15_Msp430g2231_ test15_Msp430g2231_;

/*
 * ======== host variables (unit Msp430g2231) ========
 */

typedef uint32 test15_Msp430g2231_mclkFrequency__TYPE;
extern const test15_Msp430g2231_mclkFrequency__TYPE test15_Msp430g2231_mclkFrequency__V;
typedef uint32 test15_Msp430g2231_smclkFrequency__TYPE;
extern const test15_Msp430g2231_smclkFrequency__TYPE test15_Msp430g2231_smclkFrequency__V;
typedef uint32 test15_Msp430g2231_aclkFrequency__TYPE;
extern const test15_Msp430g2231_aclkFrequency__TYPE test15_Msp430g2231_aclkFrequency__V;

/*
 * ======== function members (unit Msp430g2231) ========
 */

extern void test15_Msp430g2231_wait__E( uint32 us );
extern void test15_Msp430g2231_pollen__run__E();
extern void test15_Msp430g2231_reset__E();
extern void test15_Msp430g2231_targetInit__I();
extern void test15_Msp430g2231_shutdown__E();
extern void test15_Msp430g2231_nop__E();


/*
 * ======== data members (unit Msp430g2231) ========
 */

