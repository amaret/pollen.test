
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test28_Blink2_pollen__reset__E();
void test28_Blink2_pollen__ready__E();
void test28_Blink2_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test28_MspPin_ test28_MspPin;

/*
 * ======== struct module definition (unit MspPin) ========
 */

struct test28_MspPin_ {
};
typedef struct test28_MspPin_ test28_MspPin_;

/*
 * ======== function members (unit MspPin) ========
 */

extern void test28_MspPin_set__E();
extern void test28_MspPin_makeOutput__E();
extern bool test28_MspPin_isInput__E();
extern bool test28_MspPin_isOutput__E();
extern bool test28_MspPin_get__E();
extern void test28_MspPin_clear__E();
extern void test28_MspPin_toggle__E();
extern void test28_MspPin_makeInput__E();
extern void test28_MspPin_targetInit__I();


/*
 * ======== data members (unit MspPin) ========
 */

