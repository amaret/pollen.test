
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test35_ATmega328_pollen__reset__E();
void test35_ATmega328_pollen__ready__E();
void test35_ATmega328_pollen__shutdown__E(uint8 i);

/*
 * ======== header injections ========
 */

 #include <avr/interrupt.h> 

/*
 * ======== extern definition ========
 */

extern struct test35_Timer0MatchA_ test35_Timer0MatchA;

/*
 * ======== struct module definition (unit Timer0MatchA) ========
 */

typedef void (*test35_Timer0MatchA_InterruptHandler_isr)();
struct test35_Timer0MatchA_ {
    test35_Timer0MatchA_InterruptHandler_isr handler;
};
typedef struct test35_Timer0MatchA_ test35_Timer0MatchA_;

/*
 * ======== function members (unit Timer0MatchA) ========
 */

extern void test35_Timer0MatchA_enable__E();
extern void test35_Timer0MatchA_disable__E();
extern bool test35_Timer0MatchA_isEnabled__E();
extern void test35_Timer0MatchA_clear__E();
extern void test35_Timer0MatchA_targetInit__I();


/*
 * ======== const definitions ========
 */

#define test35_Timer0MatchA_name (test35_Timer0MatchA__s__1)
#define test35_Timer0MatchA_enableRegister (test35_Timer0MatchA__s__2)
#define test35_Timer0MatchA_enableBit (test35_Timer0MatchA__s__3)
#define test35_Timer0MatchA_clearRegister (test35_Timer0MatchA__s__4)
#define test35_Timer0MatchA_clearBit (test35_Timer0MatchA__s__5)

/*
 * ======== data members (unit Timer0MatchA) ========
 */

#define test35_Timer0MatchA_handler__V test35_Timer0MatchA.handler
