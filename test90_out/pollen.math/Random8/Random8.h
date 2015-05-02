
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

extern struct pollen_math_Random8_ pollen_math_Random8;

/*
 * ======== struct module definition (unit Random8) ========
 */

struct pollen_math_Random8_ {
    uint8 seed;
    uint8 lfsr;
    uint8 period;
};
typedef struct pollen_math_Random8_ pollen_math_Random8_;

/*
 * ======== function members (unit Random8) ========
 */

extern uint8 pollen_math_Random8_srand8__E( uint8 s );
extern uint8 pollen_math_Random8_rand8f__E();
extern uint8 pollen_math_Random8_rand8__E();
extern void pollen_math_Random8_targetInit__I();


/*
 * ======== data members (unit Random8) ========
 */

#define pollen_math_Random8_seed__V pollen_math_Random8.seed
#define pollen_math_Random8_lfsr__V pollen_math_Random8.lfsr
#define pollen_math_Random8_period__V pollen_math_Random8.period
