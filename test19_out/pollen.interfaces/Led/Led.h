
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test19_BlinkMilli2_pollen__reset__E();
void test19_BlinkMilli2_pollen__ready__E();
void test19_BlinkMilli2_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct pollen_interfaces_Led_ pollen_interfaces_Led;

/*
 * ======== struct module definition (unit Led) ========
 */

struct pollen_interfaces_Led_ {
};
typedef struct pollen_interfaces_Led_ pollen_interfaces_Led_;

/*
 * ======== function members (unit Led) ========
 */

extern bool pollen_interfaces_Led_isOn__E();
extern void pollen_interfaces_Led_toggle__E();
extern void pollen_interfaces_Led_targetInit__I();
extern void pollen_interfaces_Led_off__E();
extern void pollen_interfaces_Led_on__E();


/*
 * ======== data members (unit Led) ========
 */

