
/*
 * ======== string literals ========
 */

static const char test7_Led__s__fileName[] = "Led.p";
static const char test7_Led__s__0[] = "Led";

/*
 * ======== function definitions ========
 */

void test7_Led_targetInit__I() {
    {
        pollen_interfaces_Gpio_makeOutput__E();
    }
}

void test7_Led_on__E() {
    {
        pollen_interfaces_Gpio_clear__E();
    }
}

