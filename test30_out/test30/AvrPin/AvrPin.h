
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test30_Blink5_pollen__reset__E();
void test30_Blink5_pollen__ready__E();
void test30_Blink5_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test30_AvrPin_ test30_AvrPin;

/*
 * ======== struct module definition (unit AvrPin) ========
 */

struct test30_AvrPin_ {
};
typedef struct test30_AvrPin_ test30_AvrPin_;

/*
 * ======== function members (unit AvrPin) ========
 */

extern void test30_AvrPin_set__E();
extern void test30_AvrPin_makeOutput__E();
extern bool test30_AvrPin_isInput__E();
extern bool test30_AvrPin_isOutput__E();
extern bool test30_AvrPin_get__E();
extern void test30_AvrPin_clear__E();
extern void test30_AvrPin_toggle__E();
extern void test30_AvrPin_makeInput__E();
extern void test30_AvrPin_targetInit__I();


/*
 * ======== data members (unit AvrPin) ========
 */

