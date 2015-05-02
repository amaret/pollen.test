
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
 * ======== class definition (unit ArrCls) ========
 */

struct test62_ArrCls {
    uint8 cls_sizeHost;
    uint8 cls_sizeTarg;
    uint8 err_cls_sizeHost;
    uint8 err_cls_sizeTarg;
    uint8 targBuff_sizeHost[24];
    uint8 targBuff_sizeTarg[28];
    uint8 hostBuff_sizeHost[24];
    uint8 hostBuff_sizeTarg[28];
    uint8 err_targBuff_sizeHost[];
    uint8 err_targBuff_sizeTarg[];
    uint8 err_hostBuff_sizeHost[];
    uint8 err_hostBuff_sizeTarg[];
};
typedef struct test62_ArrCls test62_ArrCls;
typedef struct test62_ArrCls* test62_ArrCls_;


/*
 * ======== host variables (unit ArrCls) ========
 */

typedef uint8 test62_ArrCls_cls_sizeHost__TYPE;
extern test62_ArrCls_cls_sizeHost__TYPE test62_ArrCls_cls_sizeHost__V;
typedef uint8 test62_ArrCls_err_cls_sizeHost__TYPE;
extern test62_ArrCls_err_cls_sizeHost__TYPE test62_ArrCls_err_cls_sizeHost__V;
typedef uint8 test62_ArrCls_hostBuff_sizeHost__TYPE;
extern test62_ArrCls_hostBuff_sizeHost__TYPE test62_ArrCls_hostBuff_sizeHost__A[];
typedef uint8 test62_ArrCls_hostBuff_sizeTarg__TYPE;
extern test62_ArrCls_hostBuff_sizeTarg__TYPE test62_ArrCls_hostBuff_sizeTarg__A[];
typedef uint8 test62_ArrCls_err_hostBuff_sizeHost__TYPE;
extern test62_ArrCls_err_hostBuff_sizeHost__TYPE test62_ArrCls_err_hostBuff_sizeHost__A[];
typedef uint8 test62_ArrCls_err_hostBuff_sizeTarg__TYPE;
extern test62_ArrCls_err_hostBuff_sizeTarg__TYPE test62_ArrCls_err_hostBuff_sizeTarg__A[];

/*
 * ======== function members (unit ArrCls) ========
 */

extern test62_ArrCls_ test62_ArrCls_ArrCls_new___E( test62_ArrCls_ this );

