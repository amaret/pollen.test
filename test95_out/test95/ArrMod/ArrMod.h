
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

extern struct test95_ArrMod_ test95_ArrMod;

/*
 * ======== struct module definition (unit ArrMod) ========
 */

struct test95_ArrMod_ {
    uint8 sizeTarg;
    uint8 targBuff_sizeHost[8] /* sizeHost */;
    uint8 targBuff_nosize[3];
    uint8 targBuff_sizeTarg[6] /* sizeTarg */;
};
typedef struct test95_ArrMod_ test95_ArrMod_;

/*
 * ======== host variables (unit ArrMod) ========
 */

typedef uint8 test95_ArrMod_sizeHost__TYPE;
extern const test95_ArrMod_sizeHost__TYPE test95_ArrMod_sizeHost__V;
typedef uint8 test95_ArrMod_hostBuff_sizeHost__TYPE;
extern const test95_ArrMod_hostBuff_sizeHost__TYPE test95_ArrMod_hostBuff_sizeHost__A[];
typedef uint8 test95_ArrMod_hostBuff_noSize__TYPE;
extern const test95_ArrMod_hostBuff_noSize__TYPE test95_ArrMod_hostBuff_noSize__A[];
typedef uint8 test95_ArrMod_hostBuff_sizeTarg__TYPE;
extern const test95_ArrMod_hostBuff_sizeTarg__TYPE test95_ArrMod_hostBuff_sizeTarg__A[];
typedef uint8 test95_ArrMod_hostBuff_sizeConst__TYPE;
extern const test95_ArrMod_hostBuff_sizeConst__TYPE test95_ArrMod_hostBuff_sizeConst__A[];
typedef uint8 test95_ArrMod_hostBuff_sizeConst2__TYPE;
extern const test95_ArrMod_hostBuff_sizeConst2__TYPE test95_ArrMod_hostBuff_sizeConst2__A[];

/*
 * ======== function members (unit ArrMod) ========
 */

extern void test95_ArrMod_foo__E();
extern void test95_ArrMod_targetInit__I();


/*
 * ======== data members (unit ArrMod) ========
 */

#define test95_ArrMod_sizeTarg__V test95_ArrMod.sizeTarg
#define test95_ArrMod_targBuff_sizeHost__A test95_ArrMod.targBuff_sizeHost
#define test95_ArrMod_targBuff_nosize__A test95_ArrMod.targBuff_nosize
#define test95_ArrMod_targBuff_sizeTarg__A test95_ArrMod.targBuff_sizeTarg
