
/*
 * ======== string literals ========
 */

static const char pollen_parts_Led2__s__fileName[] = "Led2.p";
static const char pollen_parts_Led2__s__0[] = "Led2";

/*
 * ======== function definitions ========
 */

bool pollen_parts_Led2_isOn__E() {
    {
        return(  local_mcu_Pin2_get__E() == true  );
    }
}

void pollen_parts_Led2_toggle__E() {
    if (pollen_parts_Led2_isOn__E()) {
        pollen_parts_Led2_off__E();
    }
    else {
        pollen_parts_Led2_on__E();
    }
}

void pollen_parts_Led2_targetInit__E() {
    local_mcu_Pin2_makeOutput__E();
    pollen_parts_Led2_off__E();
}

void pollen_parts_Led2_off__E() {
    {
        local_mcu_Pin2_clear__E();
    }
}

void pollen_parts_Led2_on__E() {
    {
        local_mcu_Pin2_set__E();
    }
}

