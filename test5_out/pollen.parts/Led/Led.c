
/*
 * ======== string literals ========
 */

static const char pollen_parts_Led__s__fileName[] = "Led.p";
static const char pollen_parts_Led__s__0[] = "Led";

/*
 * ======== function definitions ========
 */

bool pollen_parts_Led_isOn__E() {
    {
        return(  pollen_interfaces_Gpio_get__E() == false  );
    }
}

void pollen_parts_Led_toggle__E() {
    pollen_interfaces_Gpio_toggle__E();
}

void pollen_parts_Led_targetInit__I() {
    pollen_interfaces_Gpio_clear__E();
    pollen_interfaces_Gpio_makeOutput__E();
}

void pollen_parts_Led_off__E() {
    {
        pollen_interfaces_Gpio_clear__E();
    }
}

void pollen_parts_Led_on__E() {
    {
        pollen_interfaces_Gpio_set__E();
    }
}

