
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test1_BlinkMilli_pollen__reset__E();
void test1_BlinkMilli_pollen__ready__E();
void test1_BlinkMilli_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test1_MoreArrays_ test1_MoreArrays;

/*
 * ======== class definition (unit MoreArrays.LittleBit) ========
 */

struct test1_MoreArrays_LittleBit {
    uint8 ii;
    bool f;
};
typedef struct test1_MoreArrays_LittleBit test1_MoreArrays_LittleBit;
typedef struct test1_MoreArrays_LittleBit* test1_MoreArrays_LittleBit_;

/*
 * ======== struct module definition (unit MoreArrays) ========
 */

struct test1_MoreArrays_ {
    uint8 arr[3] /* LEN */;
};
typedef struct test1_MoreArrays_ test1_MoreArrays_;

/*
 * ======== host variables (unit MoreArrays) ========
 */

typedef struct test1_MoreArrays_LittleBit test1_MoreArrays_lf__TYPE;
extern test1_MoreArrays_lf__TYPE test1_MoreArrays_lf__V;
typedef uint8 test1_MoreArrays_LEN__TYPE;
extern const test1_MoreArrays_LEN__TYPE test1_MoreArrays_LEN__V;
typedef uint8 test1_MoreArrays_len2__TYPE;
extern const test1_MoreArrays_len2__TYPE test1_MoreArrays_len2__V;
typedef uint8 test1_MoreArrays_arr2__TYPE;
extern const test1_MoreArrays_arr2__TYPE test1_MoreArrays_arr2__A[];

/*
 * ======== function members (unit MoreArrays) ========
 */

extern void test1_MoreArrays_foo__E();
extern void test1_MoreArrays_markUsed__E();
extern test1_MoreArrays_LittleBit_ test1_MoreArrays_LittleBit_new___E( test1_MoreArrays_LittleBit_ this );
extern void test1_MoreArrays_targetInit__I();
extern byte test1_MoreArrays_recieve__I();


/*
 * ======== data members (unit MoreArrays) ========
 */

#define test1_MoreArrays_lf__V test1_MoreArrays_lf
#define test1_MoreArrays_lf_ii__V test1_MoreArrays_lf.ii
#define test1_MoreArrays_lf_f__V test1_MoreArrays_lf.f
#define test1_MoreArrays_lf_new_host__V test1_MoreArrays_lf.new_host
#define test1_MoreArrays_lf_new___V test1_MoreArrays_lf.new_
#define test1_MoreArrays_arr__A test1_MoreArrays.arr
