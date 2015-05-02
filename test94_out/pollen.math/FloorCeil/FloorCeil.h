
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test94_Mod1_pollen__reset__E();
void test94_Mod1_pollen__ready__E();
void test94_Mod1_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct pollen_math_FloorCeil_ pollen_math_FloorCeil;

/*
 * ======== struct module definition (unit FloorCeil) ========
 */

struct pollen_math_FloorCeil_ {
};
typedef struct pollen_math_FloorCeil_ pollen_math_FloorCeil_;

/*
 * ======== function members (unit FloorCeil) ========
 */

extern uint8 pollen_math_FloorCeil_ceildivU8__E( uint8 x, uint8 y );
extern uint16 pollen_math_FloorCeil_ceildivU16__E( uint8 x, uint8 y );
extern float pollen_math_FloorCeil_ceil__E( float x );
extern float pollen_math_FloorCeil_floor__E( float x );
extern void pollen_math_FloorCeil_targetInit__I();


/*
 * ======== data members (unit FloorCeil) ========
 */

