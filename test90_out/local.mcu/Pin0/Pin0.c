
/*
 * ======== string literals ========
 */

static const char local_mcu_Pin0__s__fileName[] = "Pin0.p";
static const char local_mcu_Pin0__s__2[] = ".set\n";
static const char local_mcu_Pin0__s__9[] = ".isOutput\n";
static const char local_mcu_Pin0__s__6[] = ".makeInput\n";
static const char local_mcu_Pin0__s__3[] = ".clear\n";
static const char local_mcu_Pin0__s__10[] = "Pin0";
static const char local_mcu_Pin0__s__5[] = ".get\n";
static const char local_mcu_Pin0__s__0[] = "Pin Init: ";
static const char local_mcu_Pin0__s__7[] = ".isInput\n";
static const char local_mcu_Pin0__s__11[] = "Pin";
static const char local_mcu_Pin0__s__4[] = ".toggle\n";
static const char local_mcu_Pin0__s__8[] = ".makeOutput\n";
static const char local_mcu_Pin0__s__1[] = "\n";

/*
 * ======== function definitions ========
 */

void local_mcu_Pin0_set__E() {
    (local_mcu_Pin0_state__V) = true;
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin0_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin0__s__2);
}

void local_mcu_Pin0_makeOutput__E() {
    (local_mcu_Pin0_input__V) = false;
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin0_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin0__s__8);
}

bool local_mcu_Pin0_isInput__E() {
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin0_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin0__s__7);
    return(  (local_mcu_Pin0_input__V) == true  );
}

bool local_mcu_Pin0_isOutput__E() {
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin0_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin0__s__9);
    return(  (local_mcu_Pin0_input__V) == false  );
}

bool local_mcu_Pin0_get__E() {
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin0_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin0__s__5);
    return(  (local_mcu_Pin0_state__V)  );
}

void local_mcu_Pin0_clear__E() {
    (local_mcu_Pin0_state__V) = false;
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin0_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin0__s__3);
}

void local_mcu_Pin0_toggle__E() {
    (local_mcu_Pin0_state__V) = !(local_mcu_Pin0_state__V);
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin0_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin0__s__4);
}

void local_mcu_Pin0_targetInit__I() {
    (local_mcu_Pin0_name__V) = (local_mcu_Pin0_pname);
    (local_mcu_Pin0_num__V) = (local_mcu_Pin0_pnum);
    (local_mcu_Pin0_input__V) = false;
    (local_mcu_Pin0_state__V) = false;
    test90_Test_03_pollen__printStr((string)local_mcu_Pin0__s__0);
	test90_Test_03_pollen__printStr((string)(local_mcu_Pin0_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin0__s__1);
}

void local_mcu_Pin0_makeInput__E() {
    (local_mcu_Pin0_input__V) = true;
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin0_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin0__s__6);
}

