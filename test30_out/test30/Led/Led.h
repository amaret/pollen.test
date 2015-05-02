
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

extern struct test30_Led_ test30_Led;

/*
 * ======== struct module definition (unit Led) ========
 */

struct test30_AvrPin_;
struct test30_Led_ {
    struct test30_AvrPin_ *pin;
};
typedef struct test30_Led_ test30_Led_;

/*
 * ======== function members (unit Led) ========
 */

extern void test30_Led_toggle__E();
extern void test30_Led_targetInit__I();
extern void test30_Led_off__E();
extern void test30_Led_on__E();


/*
 * ======== data members (unit Led) ========
 */

#define test30_Led_pin__V test30_Led.pin
