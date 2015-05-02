
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

extern struct test62_ArrHostDim_ test62_ArrHostDim;

/*
 * ======== class definition (unit ArrHostDim.ClsHostDim) ========
 */

struct test62_ArrHostDim_ClsHostDim {
    uint8 targBuff_sizeHost3[17] /* sizeHost3 */;
    uint8 sizeHost3;
};
typedef struct test62_ArrHostDim_ClsHostDim test62_ArrHostDim_ClsHostDim;
typedef struct test62_ArrHostDim_ClsHostDim* test62_ArrHostDim_ClsHostDim_;

/*
 * ======== struct module definition (unit ArrHostDim) ========
 */

struct test62_ArrHostDim_ {
    uint8 targBuff_sizeHost2[16] /* sizeHost2 */;
};
typedef struct test62_ArrHostDim_ test62_ArrHostDim_;

/*
 * ======== host variables (unit ArrHostDim) ========
 */

typedef struct test62_ArrHostDim_ClsHostDim test62_ArrHostDim_cls__TYPE;
extern test62_ArrHostDim_cls__TYPE test62_ArrHostDim_cls__V;
typedef uint8 test62_ArrHostDim_sizeHost2__TYPE;
extern const test62_ArrHostDim_sizeHost2__TYPE test62_ArrHostDim_sizeHost2__V;

/*
 * ======== function members (unit ArrHostDim) ========
 */

extern test62_ArrHostDim_ClsHostDim_ test62_ArrHostDim_ClsHostDim_new___E( test62_ArrHostDim_ClsHostDim_ this );
extern void test62_ArrHostDim_targetInit__I();


/*
 * ======== data members (unit ArrHostDim) ========
 */

#define test62_ArrHostDim_cls__V test62_ArrHostDim_cls
#define test62_ArrHostDim_cls_targBuff_sizeHost3__V test62_ArrHostDim_cls.targBuff_sizeHost3
#define test62_ArrHostDim_cls_incSize__V test62_ArrHostDim_cls.incSize
#define test62_ArrHostDim_cls_sizeHost3__V test62_ArrHostDim_cls.sizeHost3
#define test62_ArrHostDim_cls_new_host__V test62_ArrHostDim_cls.new_host
#define test62_ArrHostDim_cls_sizes__V test62_ArrHostDim_cls.sizes
#define test62_ArrHostDim_cls_new___V test62_ArrHostDim_cls.new_
#define test62_ArrHostDim_targBuff_sizeHost2__A test62_ArrHostDim.targBuff_sizeHost2
