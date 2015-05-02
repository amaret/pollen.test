
/*
 * ======== string literals ========
 */

static const char test93_Mod1__s__fileName[] = "Mod1.p";
static const char test93_Mod1__s__16[] = "";
static const char test93_Mod1__s__17[] = "c";
static const char test93_Mod1__s__12[] = "3. For operand s1 = ";
static const char test93_Mod1__s__3[] = "s1 less than s2";
static const char test93_Mod1__s__18[] = "Mod1";
static const char test93_Mod1__s__7[] = ", n = ";
static const char test93_Mod1__s__10[] = "2. For operands s1 = ";
static const char test93_Mod1__s__6[] = ", s2 = ";
static const char test93_Mod1__s__15[] = "x";
static const char test93_Mod1__s__4[] = "s1, s2 equal";
static const char test93_Mod1__s__5[] = "1. For operands s1 = ";
static const char test93_Mod1__s__2[] = "s2 less than s1";
static const char test93_Mod1__s__1[] = "xyz1";
static const char test93_Mod1__s__9[] = "   strncmp() returned ";
static const char test93_Mod1__s__11[] = "   strcmp() returned ";
static const char test93_Mod1__s__14[] = "lxkjdkajfkajsd;lfkajsd;lfkja;lsefjl;asjk";
static const char test93_Mod1__s__13[] = "   strlen() returned ";
static const char test93_Mod1__s__8[] = "\n";
static const char test93_Mod1__s__0[] = "xxx1";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

string test93_Mod1_test_strcmp__I( string s1, string s2 ) {
    int32 r;
    string rslt;
    r = pollen_text_Text_strcmp__E((s1), (s2));
    rslt = (r) > 0 ? test93_Mod1__s__2 : (r) < 0 ? test93_Mod1__s__3 : test93_Mod1__s__4;
    test93_Mod1_pollen__printStr((string)test93_Mod1__s__10);
	test93_Mod1_pollen__printStr((string)(s1));
	test93_Mod1_pollen__printStr((string)test93_Mod1__s__6);
	test93_Mod1_pollen__printStr((string)(s2));
	test93_Mod1_pollen__printStr((string)test93_Mod1__s__8);
    test93_Mod1_pollen__printStr((string)test93_Mod1__s__11);
	test93_Mod1_pollen__printStr((string)(rslt));
	test93_Mod1_pollen__printStr((string)test93_Mod1__s__8);
    return(  (rslt)  );
}

void test93_Mod1_pollen__run__E() {
    string rslt;
    string s3;
    rslt = test93_Mod1_test_strncmp__I((test93_Mod1_s1__V), (test93_Mod1_s2__V), 3);
    (rslt) = test93_Mod1_test_strcmp__I((test93_Mod1_s1__V), (test93_Mod1_s2__V));
    test93_Mod1_test_strlen__I((test93_Mod1_s1__V));
    test93_Mod1_pollen__printStr((string)test93_Mod1__s__8);
    (test93_Mod1_s2__V) = (test93_Mod1_s1__V);
    s3 = test93_Mod1__s__14;
    (rslt) = test93_Mod1_test_strncmp__I((test93_Mod1_s1__V), (test93_Mod1_s2__V), 3);
    (rslt) = test93_Mod1_test_strcmp__I((test93_Mod1_s1__V), (test93_Mod1_s2__V));
    test93_Mod1_test_strlen__I((s3));
    test93_Mod1_pollen__printStr((string)test93_Mod1__s__8);
    (test93_Mod1_s2__V) = test93_Mod1__s__15;
    (s3) = test93_Mod1__s__16;
    (rslt) = test93_Mod1_test_strncmp__I((test93_Mod1_s1__V), (test93_Mod1_s2__V), 3);
    (rslt) = test93_Mod1_test_strcmp__I((test93_Mod1_s1__V), (test93_Mod1_s2__V));
    test93_Mod1_test_strlen__I((s3));
    test93_Mod1_pollen__printStr((string)test93_Mod1__s__8);
    (test93_Mod1_s2__V) = test93_Mod1__s__15;
    (s3) = (test93_Mod1_s2__V);
    (rslt) = test93_Mod1_test_strncmp__I((test93_Mod1_s1__V), (test93_Mod1_s2__V), 1);
    (rslt) = test93_Mod1_test_strcmp__I((test93_Mod1_s1__V), (test93_Mod1_s2__V));
    test93_Mod1_test_strlen__I((s3));
    test93_Mod1_pollen__printStr((string)test93_Mod1__s__8);
    (test93_Mod1_s2__V) = test93_Mod1__s__17;
    (rslt) = test93_Mod1_test_strncmp__I((test93_Mod1_s1__V), (test93_Mod1_s2__V), 1);
    (rslt) = test93_Mod1_test_strcmp__I((test93_Mod1_s1__V), (test93_Mod1_s2__V));
    test93_Mod1_pollen__printStr((string)test93_Mod1__s__8);
    (test93_Mod1_s2__V) = test93_Mod1__s__16;
    (rslt) = test93_Mod1_test_strncmp__I((test93_Mod1_s1__V), (test93_Mod1_s2__V), 1);
    (rslt) = test93_Mod1_test_strcmp__I((test93_Mod1_s1__V), (test93_Mod1_s2__V));
    test93_Mod1_pollen__printStr((string)test93_Mod1__s__8);
    (test93_Mod1_s1__V) = test93_Mod1__s__16;
    (test93_Mod1_s2__V) = test93_Mod1__s__16;
    (rslt) = test93_Mod1_test_strncmp__I((test93_Mod1_s1__V), (test93_Mod1_s2__V), 1);
    (rslt) = test93_Mod1_test_strcmp__I((test93_Mod1_s1__V), (test93_Mod1_s2__V));
    test93_Mod1_pollen__printStr((string)test93_Mod1__s__8);
     exit(0) ;

}

void test93_Mod1_test_strlen__I( string s1 ) {
    uint16 r;
    r = pollen_text_Text_strlen__E((s1));
    test93_Mod1_pollen__printStr((string)test93_Mod1__s__12);
	test93_Mod1_pollen__printStr((string)(s1));
    test93_Mod1_pollen__printStr((string)test93_Mod1__s__13);
	test93_Mod1_pollen__printUint((uint32)(r));
	test93_Mod1_pollen__printStr((string)test93_Mod1__s__8);
}

string test93_Mod1_test_strncmp__I( string s1, string s2, uint16 n ) {
    int32 r;
    string rslt;
    r = pollen_text_Text_strncmp__E((s1), (s2), (n));
    rslt = (r) > 0 ? test93_Mod1__s__2 : (r) < 0 ? test93_Mod1__s__3 : test93_Mod1__s__4;
    test93_Mod1_pollen__printStr((string)test93_Mod1__s__5);
	test93_Mod1_pollen__printStr((string)(s1));
	test93_Mod1_pollen__printStr((string)test93_Mod1__s__6);
	test93_Mod1_pollen__printStr((string)(s2));
	test93_Mod1_pollen__printStr((string)test93_Mod1__s__7);
	test93_Mod1_pollen__printUint((uint32)(n));
	test93_Mod1_pollen__printStr((string)test93_Mod1__s__8);
    test93_Mod1_pollen__printStr((string)test93_Mod1__s__9);
	test93_Mod1_pollen__printStr((string)(rslt));
	test93_Mod1_pollen__printStr((string)test93_Mod1__s__8);
    return(  (rslt)  );
}

void test93_Mod1_targetInit__I() {
}

