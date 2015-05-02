
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test46_Test1_pollen__reset__E();
void test46_Test1_pollen__ready__E();
void test46_Test1_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Qint8) ========
 */

struct pollen_data_Qint8 {
;
    uint8 capacity;
    uint8 elements[];
    uint8 length;
    uint8 head;
    uint8 tail;
};
typedef struct pollen_data_Qint8 pollen_data_Qint8;
typedef struct pollen_data_Qint8* pollen_data_Qint8_;


/*
 * ======== function members (unit Qint8) ========
 */

extern bool pollen_data_Qint8_Qint8_add__E( pollen_data_Qint8_ this, uint8 e );
extern bool pollen_data_Qint8_Qint8_isEmpty__E( pollen_data_Qint8_ this );
extern void pollen_data_Qint8_Qint8_printInt__I( pollen_data_Qint8_ this, uint32 i );
extern uint8 pollen_data_Qint8_Qint8_getLength__E( pollen_data_Qint8_ this );
extern pollen_data_Qint8_ pollen_data_Qint8_Qint8_new___E( pollen_data_Qint8_ this );
extern uint8 pollen_data_Qint8_Qint8_remove__E( pollen_data_Qint8_ this );
extern void pollen_data_Qint8_Qint8_printStr__I( pollen_data_Qint8_ this, string str );
extern uint8 pollen_data_Qint8_Qint8_peek__E( pollen_data_Qint8_ this );
extern uint8 pollen_data_Qint8_Qint8_getCapacity__E( pollen_data_Qint8_ this );

