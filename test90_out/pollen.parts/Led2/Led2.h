
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

extern struct pollen_parts_Led2_ pollen_parts_Led2;

/*
 * ======== struct module definition (unit Led2) ========
 */

struct local_mcu_Pin2_;
struct pollen_parts_Led2_ {
    struct local_mcu_Pin2_ *pin;
};
typedef struct pollen_parts_Led2_ pollen_parts_Led2_;

/*
 * ======== function members (unit Led2) ========
 */

extern bool pollen_parts_Led2_isOn__E();
extern void pollen_parts_Led2_toggle__E();
extern void pollen_parts_Led2_targetInit__E();
extern void pollen_parts_Led2_off__E();
extern void pollen_parts_Led2_on__E();


/*
 * ======== const definitions ========
 */

#define pollen_parts_Led2_activeLow (false)

/*
 * ======== data members (unit Led2) ========
 */

#define pollen_parts_Led2_pin__V pollen_parts_Led2.pin
