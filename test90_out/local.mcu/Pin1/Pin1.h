
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

extern struct local_mcu_Pin1_ local_mcu_Pin1;

/*
 * ======== struct module definition (unit Pin1) ========
 */

struct local_mcu_Pin1_ {
    string name;
    uint8 num;
    bool state;
    bool input;
    string pollen__unitname;
};
typedef struct local_mcu_Pin1_ local_mcu_Pin1_;

/*
 * ======== function members (unit Pin1) ========
 */

extern void local_mcu_Pin1_set__E();
extern void local_mcu_Pin1_makeOutput__E();
extern bool local_mcu_Pin1_isInput__E();
extern bool local_mcu_Pin1_isOutput__E();
extern bool local_mcu_Pin1_get__E();
extern void local_mcu_Pin1_clear__E();
extern void local_mcu_Pin1_toggle__E();
extern void local_mcu_Pin1_targetInit__I();
extern void local_mcu_Pin1_makeInput__E();


/*
 * ======== const definitions ========
 */

#define local_mcu_Pin1_pname (local_mcu_Pin1__s__11)
#define local_mcu_Pin1_pnum (1)

/*
 * ======== data members (unit Pin1) ========
 */

#define local_mcu_Pin1_name__V local_mcu_Pin1.name
#define local_mcu_Pin1_num__V local_mcu_Pin1.num
#define local_mcu_Pin1_state__V local_mcu_Pin1.state
#define local_mcu_Pin1_input__V local_mcu_Pin1.input
#define local_mcu_Pin1_pollen__unitname__V local_mcu_Pin1.pollen__unitname
