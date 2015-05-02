
/*
 * ======== string literals ========
 */

static const char test51_BufferTest__s__fileName[] = "BufferTest.p";
static const char test51_BufferTest__s__0[] = "BufferTest";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 

/*
 * ======== function definitions ========
 */

void test51_BufferTest_pollen__run__E() {
    uint16 i;
    i = pollen_net_transport_BufferManager_getSize__E();
    uint8 * buf = pollen_net_transport_BufferManager_getBuffer__E();
    printf("%s %d\n", "size", i) ;

}

void test51_BufferTest_targetInit__I() {
}

