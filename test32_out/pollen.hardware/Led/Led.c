
/*
 * ======== string literals ========
 */

static const char pollen_hardware_Led__s__fileName[] = "Led.p";
static const char pollen_hardware_Led__s__0[] = "Led";

/*
 * ======== function definitions ========
 */

bool pollen_hardware_Led_isOn__E() {
    {
        return(  amaret_local_A1_get__E()  );
    }
}

void pollen_hardware_Led_toggle__E() {
    amaret_local_A1_toggle__E();
}

void pollen_hardware_Led_targetInit__I() {
    pollen_hardware_Led_off__E();
}

void pollen_hardware_Led_off__E() {
    {
        amaret_local_A1_clear__E();
    }
}

void pollen_hardware_Led_on__E() {
    {
        amaret_local_A1_set__E();
    }
}

