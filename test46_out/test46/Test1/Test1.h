
/*
 * ======== imports ========
 */

#ifndef pollen_data_Qint8__M
#define pollen_data_Qint8__M
#include "../../pollen.data/Qint8/Qint8.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test46_Test1_pollen__reset__E();
void test46_Test1_pollen__ready__E();

/*
 * ======== extern definition ========
 */

extern struct test46_Test1_ test46_Test1;

/*
 * ======== struct module definition (unit Test1) ========
 */

struct pollen_data_Qint8;
struct test46_Test1_ {
};
typedef struct test46_Test1_ test46_Test1_;

/*
 * ======== host variables (unit Test1) ========
 */

typedef struct pollen_data_Qint8 test46_Test1_myQ__TYPE;
extern test46_Test1_myQ__TYPE test46_Test1_myQ__V;

/*
 * ======== function members (unit Test1) ========
 */

extern void test46_Test1_pollen__run__E();
extern void test46_Test1_pollen__shutdown__E( uint8 id );
extern void test46_Test1_targetInit__I();


/*
 * ======== data members (unit Test1) ========
 */

#define test46_Test1_myQ__V test46_Test1_myQ
