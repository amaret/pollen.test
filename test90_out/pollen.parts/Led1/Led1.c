
/*
 * ======== string literals ========
 */

static const char pollen_parts_Led1__s__fileName[] = "Led1.p";
static const char pollen_parts_Led1__s__0[] = "Led1";

/*
 * ======== function definitions ========
 */

bool pollen_parts_Led1_isOn__E() {
    {
        return(  local_mcu_Pin1_get__E() == true  );
    }
}

void pollen_parts_Led1_toggle__E() {
    if (pollen_parts_Led1_isOn__E()) {
        pollen_parts_Led1_off__E();
    }
    else {
        pollen_parts_Led1_on__E();
    }
}

void pollen_parts_Led1_targetInit__E() {
    local_mcu_Pin1_makeOutput__E();
    pollen_parts_Led1_off__E();
}

void pollen_parts_Led1_off__E() {
    {
        local_mcu_Pin1_clear__E();
    }
}

void pollen_parts_Led1_on__E() {
    {
        local_mcu_Pin1_set__E();
    }
}

