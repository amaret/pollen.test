
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test18_TestImporExport_pollen__reset__E();
void test18_TestImporExport_pollen__ready__E();
void test18_TestImporExport_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test18_Atmega328p_ test18_Atmega328p;

/*
 * ======== struct module definition (unit Atmega328p) ========
 */

struct test18_Atmega328p_ {
    uint32 sysFreq;
};
typedef struct test18_Atmega328p_ test18_Atmega328p_;

/*
 * ======== function members (unit Atmega328p) ========
 */

extern void test18_Atmega328p_wait__E( uint32 us );
extern void test18_Atmega328p_setSystemFrequency__E( uint32 hz );
extern void test18_Atmega328p_reset__E();
extern void test18_Atmega328p_targetInit__I();


/*
 * ======== data members (unit Atmega328p) ========
 */

#define test18_Atmega328p_sysFreq__V test18_Atmega328p.sysFreq
