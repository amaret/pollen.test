
/*
 * ======== string literals ========
 */

static const char local_mcu_Pin2__s__fileName[] = "Pin2.p";
static const char local_mcu_Pin2__s__2[] = ".set\n";
static const char local_mcu_Pin2__s__9[] = ".isOutput\n";
static const char local_mcu_Pin2__s__6[] = ".makeInput\n";
static const char local_mcu_Pin2__s__3[] = ".clear\n";
static const char local_mcu_Pin2__s__5[] = ".get\n";
static const char local_mcu_Pin2__s__0[] = "Pin Init: ";
static const char local_mcu_Pin2__s__7[] = ".isInput\n";
static const char local_mcu_Pin2__s__11[] = "Pin";
static const char local_mcu_Pin2__s__4[] = ".toggle\n";
static const char local_mcu_Pin2__s__8[] = ".makeOutput\n";
static const char local_mcu_Pin2__s__1[] = "\n";
static const char local_mcu_Pin2__s__10[] = "Pin2";

/*
 * ======== function definitions ========
 */

void local_mcu_Pin2_set__E() {
    (local_mcu_Pin2_state__V) = true;
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin2_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin2__s__2);
}

void local_mcu_Pin2_makeOutput__E() {
    (local_mcu_Pin2_input__V) = false;
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin2_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin2__s__8);
}

bool local_mcu_Pin2_isInput__E() {
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin2_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin2__s__7);
    return(  (local_mcu_Pin2_input__V) == true  );
}

bool local_mcu_Pin2_isOutput__E() {
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin2_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin2__s__9);
    return(  (local_mcu_Pin2_input__V) == false  );
}

bool local_mcu_Pin2_get__E() {
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin2_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin2__s__5);
    return(  (local_mcu_Pin2_state__V)  );
}

void local_mcu_Pin2_clear__E() {
    (local_mcu_Pin2_state__V) = false;
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin2_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin2__s__3);
}

void local_mcu_Pin2_toggle__E() {
    (local_mcu_Pin2_state__V) = !(local_mcu_Pin2_state__V);
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin2_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin2__s__4);
}

void local_mcu_Pin2_targetInit__I() {
    (local_mcu_Pin2_name__V) = (local_mcu_Pin2_pname);
    (local_mcu_Pin2_num__V) = (local_mcu_Pin2_pnum);
    (local_mcu_Pin2_input__V) = false;
    (local_mcu_Pin2_state__V) = false;
    test90_Test_03_pollen__printStr((string)local_mcu_Pin2__s__0);
	test90_Test_03_pollen__printStr((string)(local_mcu_Pin2_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin2__s__1);
}

void local_mcu_Pin2_makeInput__E() {
    (local_mcu_Pin2_input__V) = true;
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin2_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin2__s__6);
}

