
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test62_Test_pollen__reset__E();
void test62_Test_pollen__ready__E();
void test62_Test_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test62_ArrMod_ test62_ArrMod;

/*
 * ======== struct module definition (unit ArrMod) ========
 */

struct test62_ArrMod_ {
    uint8 sizeTarg;
    uint8 errsizeTarg;
    uint8 targBuff_sizeHost[16];
    uint8 targBuff_sizeTarg[20];
    uint8 err_targBuff_sizeHost[];
    uint8 err_targBuff_sizeTarg[];
};
typedef struct test62_ArrMod_ test62_ArrMod_;

/*
 * ======== host variables (unit ArrMod) ========
 */

typedef uint8 test62_ArrMod_sizeHost__TYPE;
extern const test62_ArrMod_sizeHost__TYPE test62_ArrMod_sizeHost__V;
typedef uint8 test62_ArrMod_errsizeHost__TYPE;
extern const test62_ArrMod_errsizeHost__TYPE test62_ArrMod_errsizeHost__V;
typedef uint8 test62_ArrMod_hostBuff_sizeHost__TYPE;
extern const test62_ArrMod_hostBuff_sizeHost__TYPE test62_ArrMod_hostBuff_sizeHost__A[];
typedef uint8 test62_ArrMod_hostBuff_sizeTarg__TYPE;
extern const test62_ArrMod_hostBuff_sizeTarg__TYPE test62_ArrMod_hostBuff_sizeTarg__A[];
typedef uint8 test62_ArrMod_err_hostBuff_sizeHost__TYPE;
extern const test62_ArrMod_err_hostBuff_sizeHost__TYPE test62_ArrMod_err_hostBuff_sizeHost__A[];
typedef uint8 test62_ArrMod_err_hostBuff_sizeTarg__TYPE;
extern const test62_ArrMod_err_hostBuff_sizeTarg__TYPE test62_ArrMod_err_hostBuff_sizeTarg__A[];

/*
 * ======== function members (unit ArrMod) ========
 */

extern void test62_ArrMod_targetInit__I();


/*
 * ======== data members (unit ArrMod) ========
 */

#define test62_ArrMod_sizeTarg__V test62_ArrMod.sizeTarg
#define test62_ArrMod_errsizeTarg__V test62_ArrMod.errsizeTarg
#define test62_ArrMod_targBuff_sizeHost__A test62_ArrMod.targBuff_sizeHost
#define test62_ArrMod_targBuff_sizeTarg__A test62_ArrMod.targBuff_sizeTarg
#define test62_ArrMod_err_targBuff_sizeHost__A test62_ArrMod.err_targBuff_sizeHost
#define test62_ArrMod_err_targBuff_sizeTarg__A test62_ArrMod.err_targBuff_sizeTarg
