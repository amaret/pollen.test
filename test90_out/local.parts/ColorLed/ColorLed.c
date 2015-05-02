
/*
 * ======== string literals ========
 */

static const char local_parts_ColorLed__s__fileName[] = "ColorLed.p";
static const char local_parts_ColorLed__s__3[] = "ColorLed";
static const char local_parts_ColorLed__s__0[] = "ColorLed set [";
static const char local_parts_ColorLed__s__1[] = ", ";
static const char local_parts_ColorLed__s__2[] = "]\n";

/*
 * ======== function definitions ========
 */

void local_parts_ColorLed_doSetColor__I() {
    uint8 r;
    uint8 g;
    uint8 b;
    uint8 a;
    r = bijou_parts_LedState_LedState_getRed__E(&(local_parts_ColorLed_state__V));
    g = bijou_parts_LedState_LedState_getGreen__E(&(local_parts_ColorLed_state__V));
    b = bijou_parts_LedState_LedState_getBlue__E(&(local_parts_ColorLed_state__V));
    a = bijou_parts_LedState_LedState_getAlpha__E(&(local_parts_ColorLed_state__V));
    test90_Test_03_pollen__printStr((string)local_parts_ColorLed__s__0);
	test90_Test_03_pollen__printUint((uint32)(r));
	test90_Test_03_pollen__printStr((string)local_parts_ColorLed__s__1);
	test90_Test_03_pollen__printUint((uint32)(g));
	test90_Test_03_pollen__printStr((string)local_parts_ColorLed__s__1);
	test90_Test_03_pollen__printUint((uint32)(b));
	test90_Test_03_pollen__printStr((string)local_parts_ColorLed__s__1);
	test90_Test_03_pollen__printUint((uint32)(a));
	test90_Test_03_pollen__printStr((string)local_parts_ColorLed__s__2);
    local_output_SendOsc_sendRGB__E((r), (g), (b));
}

void local_parts_ColorLed_setState__E( struct bijou_parts_LedState*  led ) {
    bijou_parts_LedState_LedState_setState__E(&(local_parts_ColorLed_state__V), (led));
    local_parts_ColorLed_doSetColor__I();
}

void local_parts_ColorLed_setRGBA__E( uint8 r, uint8 g, uint8 b, uint8 a ) {
    bijou_parts_LedState_LedState_setRGBA__E(&(local_parts_ColorLed_state__V), (r), (g), (b), (a));
    local_parts_ColorLed_doSetColor__I();
}

void local_parts_ColorLed_setRGB__E( uint8 r, uint8 g, uint8 b ) {
    bijou_parts_LedState_LedState_setRGB__E(&(local_parts_ColorLed_state__V), (r), (g), (b));
    local_parts_ColorLed_doSetColor__I();
}

void local_parts_ColorLed_targetInit__I() {
}

void local_parts_ColorLed_getRGBA__E( uint8  data[] ) {
    bijou_parts_LedState_LedState_getRGBA__E(&(local_parts_ColorLed_state__V), (data));
}

void local_parts_ColorLed_getRGB__E( uint8  data[] ) {
    bijou_parts_LedState_LedState_getRGB__E(&(local_parts_ColorLed_state__V), (data));
}

