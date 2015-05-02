
/*
 * ======== string literals ========
 */

static const char test6_Led1__s__fileName[] = "Led1.p";
static const char test6_Led1__s__1[] = "Led1";
static const char test6_Led1__s__0[] = "Y";

/*
 * ======== function definitions ========
 */

void test6_Led1_targetInit__I() {
    {
        test6_Y_set__E();
    }
}

void test6_Led1_on__E() {
    string n;
    n = (test6_Led1_pollen__unitname__V);
    {
        pollen_interfaces_Gpio_clear__E();
    }
}

