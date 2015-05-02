
/*
 * ======== string literals ========
 */

static const char pollen_parts_Led0__s__fileName[] = "Led0.p";
static const char pollen_parts_Led0__s__0[] = "Led0";

/*
 * ======== function definitions ========
 */

bool pollen_parts_Led0_isOn__E() {
    {
        return(  local_mcu_Pin0_get__E() == true  );
    }
}

void pollen_parts_Led0_toggle__E() {
    if (pollen_parts_Led0_isOn__E()) {
        pollen_parts_Led0_off__E();
    }
    else {
        pollen_parts_Led0_on__E();
    }
}

void pollen_parts_Led0_targetInit__E() {
    local_mcu_Pin0_makeOutput__E();
    pollen_parts_Led0_off__E();
}

void pollen_parts_Led0_off__E() {
    {
        local_mcu_Pin0_clear__E();
    }
}

void pollen_parts_Led0_on__E() {
    {
        local_mcu_Pin0_set__E();
    }
}

