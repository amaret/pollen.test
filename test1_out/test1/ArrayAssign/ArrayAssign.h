
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

extern struct test1_ArrayAssign_ test1_ArrayAssign;

/*
 * ======== struct module definition (unit ArrayAssign) ========
 */

struct test1_ArrayAssign_ {
    uint8 buffer[5];
};
typedef struct test1_ArrayAssign_ test1_ArrayAssign_;

/*
 * ======== function members (unit ArrayAssign) ========
 */

extern void test1_ArrayAssign_bar__I();
extern void test1_ArrayAssign_pollen__run__E();
extern void test1_ArrayAssign_foo__I( byte  data[], uint8 length );
extern void test1_ArrayAssign_markUsed__E();
extern void test1_ArrayAssign_targetInit__I();


/*
 * ======== data members (unit ArrayAssign) ========
 */

#define test1_ArrayAssign_buffer__A test1_ArrayAssign.buffer
