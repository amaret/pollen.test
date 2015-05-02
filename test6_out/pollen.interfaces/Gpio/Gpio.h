
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test6_T_pollen__reset__E();
void test6_T_pollen__ready__E();
void test6_T_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct pollen_interfaces_Gpio_ pollen_interfaces_Gpio;

/*
 * ======== struct module definition (unit Gpio) ========
 */

struct pollen_interfaces_Gpio_ {
};
typedef struct pollen_interfaces_Gpio_ pollen_interfaces_Gpio_;

/*
 * ======== function members (unit Gpio) ========
 */

extern void pollen_interfaces_Gpio_set__E();
extern void pollen_interfaces_Gpio_makeOutput__E();
extern bool pollen_interfaces_Gpio_isInput__E();
extern bool pollen_interfaces_Gpio_isOutput__E();
extern bool pollen_interfaces_Gpio_get__E();
extern void pollen_interfaces_Gpio_clear__E();
extern void pollen_interfaces_Gpio_toggle__E();
extern void pollen_interfaces_Gpio_makeInput__E();
extern void pollen_interfaces_Gpio_targetInit__I();


/*
 * ======== data members (unit Gpio) ========
 */

