
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

extern struct local_mcu_Pin2_ local_mcu_Pin2;

/*
 * ======== struct module definition (unit Pin2) ========
 */

struct local_mcu_Pin2_ {
    string name;
    uint8 num;
    bool state;
    bool input;
    string pollen__unitname;
};
typedef struct local_mcu_Pin2_ local_mcu_Pin2_;

/*
 * ======== function members (unit Pin2) ========
 */

extern void local_mcu_Pin2_set__E();
extern void local_mcu_Pin2_makeOutput__E();
extern bool local_mcu_Pin2_isInput__E();
extern bool local_mcu_Pin2_isOutput__E();
extern bool local_mcu_Pin2_get__E();
extern void local_mcu_Pin2_clear__E();
extern void local_mcu_Pin2_toggle__E();
extern void local_mcu_Pin2_targetInit__I();
extern void local_mcu_Pin2_makeInput__E();


/*
 * ======== const definitions ========
 */

#define local_mcu_Pin2_pname (local_mcu_Pin2__s__11)
#define local_mcu_Pin2_pnum (2)

/*
 * ======== data members (unit Pin2) ========
 */

#define local_mcu_Pin2_name__V local_mcu_Pin2.name
#define local_mcu_Pin2_num__V local_mcu_Pin2.num
#define local_mcu_Pin2_state__V local_mcu_Pin2.state
#define local_mcu_Pin2_input__V local_mcu_Pin2.input
#define local_mcu_Pin2_pollen__unitname__V local_mcu_Pin2.pollen__unitname
