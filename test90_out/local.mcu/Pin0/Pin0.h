
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

extern struct local_mcu_Pin0_ local_mcu_Pin0;

/*
 * ======== struct module definition (unit Pin0) ========
 */

struct local_mcu_Pin0_ {
    string name;
    uint8 num;
    bool state;
    bool input;
    string pollen__unitname;
};
typedef struct local_mcu_Pin0_ local_mcu_Pin0_;

/*
 * ======== function members (unit Pin0) ========
 */

extern void local_mcu_Pin0_set__E();
extern void local_mcu_Pin0_makeOutput__E();
extern bool local_mcu_Pin0_isInput__E();
extern bool local_mcu_Pin0_isOutput__E();
extern bool local_mcu_Pin0_get__E();
extern void local_mcu_Pin0_clear__E();
extern void local_mcu_Pin0_toggle__E();
extern void local_mcu_Pin0_targetInit__I();
extern void local_mcu_Pin0_makeInput__E();


/*
 * ======== const definitions ========
 */

#define local_mcu_Pin0_pname (local_mcu_Pin0__s__11)
#define local_mcu_Pin0_pnum (0)

/*
 * ======== data members (unit Pin0) ========
 */

#define local_mcu_Pin0_name__V local_mcu_Pin0.name
#define local_mcu_Pin0_num__V local_mcu_Pin0.num
#define local_mcu_Pin0_state__V local_mcu_Pin0.state
#define local_mcu_Pin0_input__V local_mcu_Pin0.input
#define local_mcu_Pin0_pollen__unitname__V local_mcu_Pin0.pollen__unitname
