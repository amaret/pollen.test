
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test121_Test_01_pollen__reset__E();
void test121_Test_01_pollen__ready__E();
void test121_Test_01_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct atmel_atmega_PB4_ atmel_atmega_PB4;

/*
 * ======== struct module definition (unit PB4) ========
 */

struct atmel_atmega_PB4_ {
};
typedef struct atmel_atmega_PB4_ atmel_atmega_PB4_;

/*
 * ======== host variables (unit PB4) ========
 */

typedef uint8 atmel_atmega_PB4_pinMask__TYPE;
extern const atmel_atmega_PB4_pinMask__TYPE atmel_atmega_PB4_pinMask__V;

/*
 * ======== function members (unit PB4) ========
 */

extern void atmel_atmega_PB4_set__E();
extern void atmel_atmega_PB4_makeOutput__E();
extern bool atmel_atmega_PB4_isInput__E();
extern bool atmel_atmega_PB4_isOutput__E();
extern bool atmel_atmega_PB4_get__E();
extern void atmel_atmega_PB4_clear__E();
extern void atmel_atmega_PB4_toggle__E();
extern void atmel_atmega_PB4_makeInput__E();
extern void atmel_atmega_PB4_targetInit__I();


/*
 * ======== const definitions ========
 */

#define atmel_atmega_PB4_port (atmel_atmega_PB4__s__1)
#define atmel_atmega_PB4_pin (4)

/*
 * ======== data members (unit PB4) ========
 */

