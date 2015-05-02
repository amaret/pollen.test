
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

extern struct test61_Led_ test61_Led;

/*
 * ======== struct module definition (unit Led) ========
 */

struct test61_AvrPin_;
struct test61_Led_ {
    struct test61_AvrPin_ *pin;
};
typedef struct test61_Led_ test61_Led_;

/*
 * ======== function members (unit Led) ========
 */

extern void test61_Led_toggle__E();
extern void test61_Led_targetInit__I();
extern void test61_Led_off__E();
extern void test61_Led_on__E();


/*
 * ======== data members (unit Led) ========
 */

#define test61_Led_pin__V test61_Led.pin
