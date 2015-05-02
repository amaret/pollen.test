
/*
 * ======== imports ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test119_BlinkMilli_pollen__reset__E();
void test119_BlinkMilli_pollen__ready__E();
void test119_BlinkMilli_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test119_BlinkMilli_ test119_BlinkMilli;

/*
 * ======== struct module definition (unit BlinkMilli) ========
 */

struct test54_PrintImpl_;
struct test119_BlinkMilli_ {
    uint8 nonhostarr[4];
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test119_BlinkMilli_ test119_BlinkMilli_;

/*
 * ======== host variables (unit BlinkMilli) ========
 */

typedef uint8 test119_BlinkMilli_hostarr__TYPE;
extern const test119_BlinkMilli_hostarr__TYPE test119_BlinkMilli_hostarr__A[];

/*
 * ======== function members (unit BlinkMilli) ========
 */

extern void test119_BlinkMilli_test__I();
extern void test119_BlinkMilli_pollen__run__E();
extern void test119_BlinkMilli_targetInit__I();


/*
 * ======== data members (unit BlinkMilli) ========
 */

#define test119_BlinkMilli_nonhostarr__A test119_BlinkMilli.nonhostarr
#define test119_BlinkMilli_pollenPrintProxy__V test119_BlinkMilli.pollenPrintProxy
