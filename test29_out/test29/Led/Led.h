
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

extern struct test29_Led_ test29_Led;

/*
 * ======== struct module definition (unit Led) ========
 */

struct test29_AvrPin_;
struct test29_Led_ {
    struct test29_AvrPin_ *pin;
};
typedef struct test29_Led_ test29_Led_;

/*
 * ======== function members (unit Led) ========
 */

extern void test29_Led_toggle__E();
extern void test29_Led_targetInit__I();
extern void test29_Led_off__E();
extern void test29_Led_on__E();


/*
 * ======== data members (unit Led) ========
 */

#define test29_Led_pin__V test29_Led.pin
