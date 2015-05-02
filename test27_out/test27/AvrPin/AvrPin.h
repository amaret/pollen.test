
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test27_Blink3_pollen__reset__E();
void test27_Blink3_pollen__ready__E();
void test27_Blink3_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test27_AvrPin_ test27_AvrPin;

/*
 * ======== struct module definition (unit AvrPin) ========
 */

struct test27_AvrPin_ {
};
typedef struct test27_AvrPin_ test27_AvrPin_;

/*
 * ======== function members (unit AvrPin) ========
 */

extern void test27_AvrPin_set__E();
extern void test27_AvrPin_makeOutput__E();
extern bool test27_AvrPin_isInput__E();
extern bool test27_AvrPin_isOutput__E();
extern bool test27_AvrPin_get__E();
extern void test27_AvrPin_clear__E();
extern void test27_AvrPin_toggle__E();
extern void test27_AvrPin_makeInput__E();
extern void test27_AvrPin_targetInit__I();


/*
 * ======== data members (unit AvrPin) ========
 */

