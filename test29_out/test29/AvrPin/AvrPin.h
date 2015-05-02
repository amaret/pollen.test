
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test29_Blink4_pollen__reset__E();
void test29_Blink4_pollen__ready__E();
void test29_Blink4_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test29_AvrPin_ test29_AvrPin;

/*
 * ======== struct module definition (unit AvrPin) ========
 */

struct test29_AvrPin_ {
};
typedef struct test29_AvrPin_ test29_AvrPin_;

/*
 * ======== function members (unit AvrPin) ========
 */

extern void test29_AvrPin_set__E();
extern void test29_AvrPin_makeOutput__E();
extern bool test29_AvrPin_isInput__E();
extern bool test29_AvrPin_isOutput__E();
extern bool test29_AvrPin_get__E();
extern void test29_AvrPin_clear__E();
extern void test29_AvrPin_toggle__E();
extern void test29_AvrPin_makeInput__E();
extern void test29_AvrPin_targetInit__I();


/*
 * ======== data members (unit AvrPin) ========
 */

