
/*
 * ======== string literals ========
 */

static const char local_mcu_Pin1__s__fileName[] = "Pin1.p";
static const char local_mcu_Pin1__s__2[] = ".set\n";
static const char local_mcu_Pin1__s__9[] = ".isOutput\n";
static const char local_mcu_Pin1__s__6[] = ".makeInput\n";
static const char local_mcu_Pin1__s__3[] = ".clear\n";
static const char local_mcu_Pin1__s__5[] = ".get\n";
static const char local_mcu_Pin1__s__10[] = "Pin1";
static const char local_mcu_Pin1__s__0[] = "Pin Init: ";
static const char local_mcu_Pin1__s__7[] = ".isInput\n";
static const char local_mcu_Pin1__s__11[] = "Pin";
static const char local_mcu_Pin1__s__4[] = ".toggle\n";
static const char local_mcu_Pin1__s__8[] = ".makeOutput\n";
static const char local_mcu_Pin1__s__1[] = "\n";

/*
 * ======== function definitions ========
 */

void local_mcu_Pin1_set__E() {
    (local_mcu_Pin1_state__V) = true;
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin1_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin1__s__2);
}

void local_mcu_Pin1_makeOutput__E() {
    (local_mcu_Pin1_input__V) = false;
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin1_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin1__s__8);
}

bool local_mcu_Pin1_isInput__E() {
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin1_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin1__s__7);
    return(  (local_mcu_Pin1_input__V) == true  );
}

bool local_mcu_Pin1_isOutput__E() {
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin1_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin1__s__9);
    return(  (local_mcu_Pin1_input__V) == false  );
}

bool local_mcu_Pin1_get__E() {
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin1_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin1__s__5);
    return(  (local_mcu_Pin1_state__V)  );
}

void local_mcu_Pin1_clear__E() {
    (local_mcu_Pin1_state__V) = false;
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin1_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin1__s__3);
}

void local_mcu_Pin1_toggle__E() {
    (local_mcu_Pin1_state__V) = !(local_mcu_Pin1_state__V);
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin1_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin1__s__4);
}

void local_mcu_Pin1_targetInit__I() {
    (local_mcu_Pin1_name__V) = (local_mcu_Pin1_pname);
    (local_mcu_Pin1_num__V) = (local_mcu_Pin1_pnum);
    (local_mcu_Pin1_input__V) = false;
    (local_mcu_Pin1_state__V) = false;
    test90_Test_03_pollen__printStr((string)local_mcu_Pin1__s__0);
	test90_Test_03_pollen__printStr((string)(local_mcu_Pin1_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin1__s__1);
}

void local_mcu_Pin1_makeInput__E() {
    (local_mcu_Pin1_input__V) = true;
    test90_Test_03_pollen__printStr((string)(local_mcu_Pin1_pollen__unitname__V));
	test90_Test_03_pollen__printStr((string)local_mcu_Pin1__s__6);
}

