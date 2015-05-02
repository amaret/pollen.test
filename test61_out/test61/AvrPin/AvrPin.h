
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test61_Blink_pollen__reset__E();
void test61_Blink_pollen__ready__E();
void test61_Blink_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test61_AvrPin_ test61_AvrPin;

/*
 * ======== struct module definition (unit AvrPin) ========
 */

struct test61_AvrPin_ {
    uint32 PORTB;
    uint32 DDRB;
};
typedef struct test61_AvrPin_ test61_AvrPin_;

/*
 * ======== function members (unit AvrPin) ========
 */

extern void test61_AvrPin_set__E();
extern void test61_AvrPin_makeOutput__E();
extern bool test61_AvrPin_isInput__E();
extern bool test61_AvrPin_isOutput__E();
extern bool test61_AvrPin_get__E();
extern void test61_AvrPin_clear__E();
extern void test61_AvrPin_toggle__E();
extern void test61_AvrPin_makeInput__E();
extern void test61_AvrPin_targetInit__I();


/*
 * ======== data members (unit AvrPin) ========
 */

#define test61_AvrPin_PORTB__V test61_AvrPin.PORTB
#define test61_AvrPin_DDRB__V test61_AvrPin.DDRB
