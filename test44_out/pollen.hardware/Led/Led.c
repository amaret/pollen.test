
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
        return(  atmel_atmega8_PB5_get__E()  );
    }
}

void pollen_hardware_Led_toggle__E() {
    atmel_atmega8_PB5_toggle__E();
}

void pollen_hardware_Led_targetInit__I() {
    pollen_hardware_Led_off__E();
    atmel_atmega8_PB5_makeOutput__E();
}

void pollen_hardware_Led_off__E() {
    {
        atmel_atmega8_PB5_clear__E();
    }
}

void pollen_hardware_Led_on__E() {
    {
        atmel_atmega8_PB5_set__E();
    }
}

