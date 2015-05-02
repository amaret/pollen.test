
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void localhost_Lifecycle_pollen__reset__E();
void localhost_Lifecycle_pollen__ready__E();
void localhost_Lifecycle_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct pollen_parts_Led0_ pollen_parts_Led0;

/*
 * ======== struct module definition (unit Led0) ========
 */

struct local_mcu_Pin0_;
struct pollen_parts_Led0_ {
    struct local_mcu_Pin0_ *pin;
};
typedef struct pollen_parts_Led0_ pollen_parts_Led0_;

/*
 * ======== function members (unit Led0) ========
 */

extern bool pollen_parts_Led0_isOn__E();
extern void pollen_parts_Led0_toggle__E();
extern void pollen_parts_Led0_targetInit__E();
extern void pollen_parts_Led0_off__E();
extern void pollen_parts_Led0_on__E();


/*
 * ======== const definitions ========
 */

#define pollen_parts_Led0_activeLow (false)

/*
 * ======== data members (unit Led0) ========
 */

#define pollen_parts_Led0_pin__V pollen_parts_Led0.pin
