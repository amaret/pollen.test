
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test95_Test_pollen__reset__E();
void test95_Test_pollen__ready__E();
void test95_Test_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test95_Arr_ test95_Arr;

/*
 * ======== class definition (unit Arr.Cls) ========
 */

struct test95_Arr_Cls {
    uint8 clsV;
};
typedef struct test95_Arr_Cls test95_Arr_Cls;
typedef struct test95_Arr_Cls* test95_Arr_Cls_;

/*
 * ======== struct module definition (unit Arr) ========
 */

struct test95_Arr_ {
    uint8 targBuff_sizeHost[8] /* sizeHost */;
};
typedef struct test95_Arr_ test95_Arr_;

/*
 * ======== host variables (unit Arr) ========
 */

typedef struct test95_Arr_Cls test95_Arr_clsVar__TYPE;
extern test95_Arr_clsVar__TYPE test95_Arr_clsVar__V;
typedef uint8 test95_Arr_sizeHost__TYPE;
extern const test95_Arr_sizeHost__TYPE test95_Arr_sizeHost__V;
typedef test95_Arr_Cls test95_Arr_hostBuff_clsObj__TYPE;
extern test95_Arr_hostBuff_clsObj__TYPE test95_Arr_hostBuff_clsObj__A[];

/*
 * ======== function members (unit Arr) ========
 */

extern test95_Arr_Cls_ test95_Arr_Cls_new___E( test95_Arr_Cls_ this );
extern uint8 test95_Arr_Cls_getClsVar__E( test95_Arr_Cls_ this );
extern void test95_Arr_targetInit__I();
extern void test95_Arr_checkAccess__E();


/*
 * ======== data members (unit Arr) ========
 */

#define test95_Arr_clsVar__V test95_Arr_clsVar
#define test95_Arr_clsVar_clsV__V test95_Arr_clsVar.clsV
#define test95_Arr_clsVar_new_host__V test95_Arr_clsVar.new_host
#define test95_Arr_clsVar_getClsVar__V test95_Arr_clsVar.getClsVar
#define test95_Arr_clsVar_new___V test95_Arr_clsVar.new_
#define test95_Arr_targBuff_sizeHost__A test95_Arr.targBuff_sizeHost
