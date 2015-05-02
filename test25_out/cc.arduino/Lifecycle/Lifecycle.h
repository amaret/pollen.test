
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */


/*
 * ======== extern definition ========
 */

extern struct cc_arduino_Lifecycle_ cc_arduino_Lifecycle;

/*
 * ======== struct module definition (unit Lifecycle) ========
 */

struct cc_arduino_Lifecycle_ {
};
typedef struct cc_arduino_Lifecycle_ cc_arduino_Lifecycle_;

/*
 * ======== function members (unit Lifecycle) ========
 */

extern void cc_arduino_Lifecycle_pollen__reset__E();
extern void cc_arduino_Lifecycle_pollen__wake__E( uint8 level );
extern void cc_arduino_Lifecycle_pollen__free__E();
extern void cc_arduino_Lifecycle_pollen__ready__E();
extern void cc_arduino_Lifecycle_pollen__shutdown__E( uint8 id );
extern void cc_arduino_Lifecycle_pollen__hibernate__E( uint8 level );
extern void cc_arduino_Lifecycle_targetInit__I();


/*
 * ======== data members (unit Lifecycle) ========
 */

