
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

extern struct pollen_parts_Led1_ pollen_parts_Led1;

/*
 * ======== struct module definition (unit Led1) ========
 */

struct local_mcu_Pin1_;
struct pollen_parts_Led1_ {
    struct local_mcu_Pin1_ *pin;
};
typedef struct pollen_parts_Led1_ pollen_parts_Led1_;

/*
 * ======== function members (unit Led1) ========
 */

extern bool pollen_parts_Led1_isOn__E();
extern void pollen_parts_Led1_toggle__E();
extern void pollen_parts_Led1_targetInit__E();
extern void pollen_parts_Led1_off__E();
extern void pollen_parts_Led1_on__E();


/*
 * ======== const definitions ========
 */

#define pollen_parts_Led1_activeLow (false)

/*
 * ======== data members (unit Led1) ========
 */

#define pollen_parts_Led1_pin__V pollen_parts_Led1.pin
