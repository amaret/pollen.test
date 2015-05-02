
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test5_BlinkMilli_pollen__reset__E();
void test5_BlinkMilli_pollen__ready__E();
void test5_BlinkMilli_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct pollen_parts_Led_ pollen_parts_Led;

/*
 * ======== struct module definition (unit Led) ========
 */

struct pollen_interfaces_Gpio_;
struct pollen_parts_Led_ {
    struct pollen_interfaces_Gpio_ *Gpio;
};
typedef struct pollen_parts_Led_ pollen_parts_Led_;

/*
 * ======== function members (unit Led) ========
 */

extern bool pollen_parts_Led_isOn__E();
extern void pollen_parts_Led_toggle__E();
extern void pollen_parts_Led_targetInit__I();
extern void pollen_parts_Led_off__E();
extern void pollen_parts_Led_on__E();


/*
 * ======== const definitions ========
 */

#define pollen_parts_Led_isActiveLow (false)

/*
 * ======== data members (unit Led) ========
 */

#define pollen_parts_Led_Gpio__V pollen_parts_Led.Gpio
