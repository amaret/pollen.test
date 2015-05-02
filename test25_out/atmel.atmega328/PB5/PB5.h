
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void cc_arduino_Lifecycle_pollen__reset__E();
void cc_arduino_Lifecycle_pollen__ready__E();
void cc_arduino_Lifecycle_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct atmel_atmega328_PB5_ atmel_atmega328_PB5;

/*
 * ======== struct module definition (unit PB5) ========
 */

struct atmel_atmega328_PB5_ {
};
typedef struct atmel_atmega328_PB5_ atmel_atmega328_PB5_;

/*
 * ======== function members (unit PB5) ========
 */

extern void atmel_atmega328_PB5_set__E();
extern void atmel_atmega328_PB5_makeOutput__E();
extern bool atmel_atmega328_PB5_isInput__E();
extern bool atmel_atmega328_PB5_isOutput__E();
extern bool atmel_atmega328_PB5_get__E();
extern void atmel_atmega328_PB5_clear__E();
extern void atmel_atmega328_PB5_toggle__E();
extern void atmel_atmega328_PB5_makeInput__E();
extern void atmel_atmega328_PB5_targetInit__I();


/*
 * ======== const definitions ========
 */

#define atmel_atmega328_PB5_portRegister (atmel_atmega328_PB5__s__1)
#define atmel_atmega328_PB5_directionRegister (atmel_atmega328_PB5__s__2)
#define atmel_atmega328_PB5_bit (5)

/*
 * ======== data members (unit PB5) ========
 */

