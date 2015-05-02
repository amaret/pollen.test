
/*
 * ======== imports ========
 */

#ifndef test116_C1__M
#define test116_C1__M
#include "../../test116/C1/C1.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test116_ArrayInitBug_pollen__reset__E();
void test116_ArrayInitBug_pollen__ready__E();

/*
 * ======== enum definitions (unit ArrayInitBug) ========
 */

typedef uint8 test116_ArrayInitBug_Pos;
#define test116_ArrayInitBug_Pos_Zero 0
#define test116_ArrayInitBug_Pos_One 1
#define test116_ArrayInitBug_Pos_Two 2

/*
 * ======== extern definition ========
 */

extern struct test116_ArrayInitBug_ test116_ArrayInitBug;

/*
 * ======== struct module definition (unit ArrayInitBug) ========
 */

struct test116_C1;
struct test54_PrintImpl_;
struct test116_ArrayInitBug_ {
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test116_ArrayInitBug_ test116_ArrayInitBug_;

/*
 * ======== host variables (unit ArrayInitBug) ========
 */

typedef test116_C1 test116_ArrayInitBug_array__TYPE;
extern test116_ArrayInitBug_array__TYPE test116_ArrayInitBug_array__A[];

/*
 * ======== function members (unit ArrayInitBug) ========
 */

extern void test116_ArrayInitBug_test__I( struct test116_C1*  c );
extern void test116_ArrayInitBug_pollen__run__E();
extern void test116_ArrayInitBug_pollen__shutdown__E( uint8 id );
extern void test116_ArrayInitBug_targetInit__I();


/*
 * ======== data members (unit ArrayInitBug) ========
 */

#define test116_ArrayInitBug_pollenPrintProxy__V test116_ArrayInitBug.pollenPrintProxy
