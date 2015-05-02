
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test49_Client_pollen__reset__E();
void test49_Client_pollen__ready__E();
void test49_Client_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test49_Client_ test49_Client;

/*
 * ======== struct module definition (unit Client) ========
 */

struct test49_Event_uint8;
struct test49_Client_ {
    struct test49_Event_uint8*  e;
    const uint8 econst;
    uint8 x;
};
typedef struct test49_Client_ test49_Client_;

/*
 * ======== function members (unit Client) ========
 */

extern void test49_Client_pollen__run__E();
extern void test49_Client_handle__E( uint8 v );
extern void test49_Client_targetInit__E();


/*
 * ======== const definitions ========
 */

#define test49_Client_econst (8)

/*
 * ======== data members (unit Client) ========
 */

#define test49_Client_e__V test49_Client.e
#define test49_Client_econst__V test49_Client.econst
#define test49_Client_x__V test49_Client.x
