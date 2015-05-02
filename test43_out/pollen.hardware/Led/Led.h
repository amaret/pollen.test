
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test43_BlinkEnvLed_pollen__reset__E();
void test43_BlinkEnvLed_pollen__ready__E();
void test43_BlinkEnvLed_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct pollen_hardware_Led_ pollen_hardware_Led;

/*
 * ======== struct module definition (unit Led) ========
 */

struct atmel_atmega8_PB5_;
struct pollen_hardware_Led_ {
    struct atmel_atmega8_PB5_ *pin;
};
typedef struct pollen_hardware_Led_ pollen_hardware_Led_;

/*
 * ======== function members (unit Led) ========
 */

extern bool pollen_hardware_Led_isOn__E();
extern void pollen_hardware_Led_toggle__E();
extern void pollen_hardware_Led_targetInit__I();
extern void pollen_hardware_Led_off__E();
extern void pollen_hardware_Led_on__E();


/*
 * ======== const definitions ========
 */

#define pollen_hardware_Led_activeLow (false)

/*
 * ======== data members (unit Led) ========
 */

#define pollen_hardware_Led_pin__V pollen_hardware_Led.pin
