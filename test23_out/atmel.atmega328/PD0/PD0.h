
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test23_Blink4_pollen__reset__E();
void test23_Blink4_pollen__ready__E();
void test23_Blink4_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct atmel_atmega328_PD0_ atmel_atmega328_PD0;

/*
 * ======== struct module definition (unit PD0) ========
 */

struct atmel_atmega328_PD0_ {
};
typedef struct atmel_atmega328_PD0_ atmel_atmega328_PD0_;

/*
 * ======== function members (unit PD0) ========
 */

extern void atmel_atmega328_PD0_set__E();
extern void atmel_atmega328_PD0_makeOutput__E();
extern bool atmel_atmega328_PD0_isInput__E();
extern bool atmel_atmega328_PD0_isOutput__E();
extern bool atmel_atmega328_PD0_get__E();
extern void atmel_atmega328_PD0_clear__E();
extern void atmel_atmega328_PD0_toggle__E();
extern void atmel_atmega328_PD0_makeInput__E();
extern void atmel_atmega328_PD0_targetInit__I();


/*
 * ======== const definitions ========
 */

#define atmel_atmega328_PD0_portRegister (atmel_atmega328_PD0__s__1)
#define atmel_atmega328_PD0_directionRegister (atmel_atmega328_PD0__s__2)
#define atmel_atmega328_PD0_bit (0)

/*
 * ======== data members (unit PD0) ========
 */

