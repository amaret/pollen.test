
/*
 * ======== string literals ========
 */

static const char test6_Led2__s__fileName[] = "Led2.p";
static const char test6_Led2__s__1[] = "Led2";
static const char test6_Led2__s__0[] = "Y";

/*
 * ======== function definitions ========
 */

void test6_Led2_targetInit__I() {
    {
        test6_Y_set__E();
    }
}

void test6_Led2_on__E() {
    string n;
    n = (test6_Led2_pollen__unitname__V);
    {
        pollen_interfaces_Gpio_set__E();
    }
}

