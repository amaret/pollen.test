
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

extern struct pollen_math_Random16_ pollen_math_Random16;

/*
 * ======== struct module definition (unit Random16) ========
 */

struct pollen_math_Random16_ {
    uint16 seed;
    uint16 lfsr;
    uint16 period;
};
typedef struct pollen_math_Random16_ pollen_math_Random16_;

/*
 * ======== function members (unit Random16) ========
 */

extern uint16 pollen_math_Random16_srand16__E( uint16 s );
extern uint16 pollen_math_Random16_rand16f__E();
extern uint16 pollen_math_Random16_rand16__E();
extern void pollen_math_Random16_targetInit__I();


/*
 * ======== data members (unit Random16) ========
 */

#define pollen_math_Random16_seed__V pollen_math_Random16.seed
#define pollen_math_Random16_lfsr__V pollen_math_Random16.lfsr
#define pollen_math_Random16_period__V pollen_math_Random16.period
