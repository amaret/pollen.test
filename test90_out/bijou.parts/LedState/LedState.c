
/*
 * ======== string literals ========
 */

static const char bijou_parts_LedState__s__fileName[] = "LedState.p";
static const char bijou_parts_LedState__s__0[] = "LedState";

/*
 * ======== function definitions ========
 */

void bijou_parts_LedState_LedState_apply__E( bijou_parts_LedState_ this ) {
    local_parts_ColorLed_setState__E(this);
}

bijou_parts_LedState_ bijou_parts_LedState_LedState_setRGB__E( bijou_parts_LedState_ this, uint8 red, uint8 green, uint8 blue ) {
    this->rgba[(bijou_parts_LedState_Colors_Red)] = (red);
    this->rgba[(bijou_parts_LedState_Colors_Green)] = (green);
    this->rgba[(bijou_parts_LedState_Colors_Blue)] = (blue);
    return(  this  );
}

bijou_parts_LedState_ bijou_parts_LedState_LedState_setAlpha__E( bijou_parts_LedState_ this, uint8 alpha ) {
    this->rgba[(bijou_parts_LedState_Colors_Alpha)] = (alpha);
    return(  this  );
}

uint8 bijou_parts_LedState_LedState_getId__E( bijou_parts_LedState_ this ) {
    return(  this->id  );
}

bijou_parts_LedState_ bijou_parts_LedState_LedState_new___E( bijou_parts_LedState_ this ) {
    return this;
}

bijou_parts_LedState_ bijou_parts_LedState_LedState_setRed__E( bijou_parts_LedState_ this, uint8 red ) {
    this->rgba[(bijou_parts_LedState_Colors_Red)] = (red);
    return(  this  );
}

bijou_parts_LedState_ bijou_parts_LedState_LedState_setGreen__E( bijou_parts_LedState_ this, uint8 green ) {
    this->rgba[(bijou_parts_LedState_Colors_Green)] = (green);
    return(  this  );
}

uint8 bijou_parts_LedState_LedState_getBlue__E( bijou_parts_LedState_ this ) {
    return(  this->rgba[(bijou_parts_LedState_Colors_Blue)]  );
}

void bijou_parts_LedState_LedState_getRGBA__E( bijou_parts_LedState_ this, uint8  rgba[] ) {
    (rgba[(bijou_parts_LedState_Colors_Red)]) = this->rgba[(bijou_parts_LedState_Colors_Red)];
    (rgba[(bijou_parts_LedState_Colors_Green)]) = this->rgba[(bijou_parts_LedState_Colors_Green)];
    (rgba[(bijou_parts_LedState_Colors_Blue)]) = this->rgba[(bijou_parts_LedState_Colors_Blue)];
    (rgba[(bijou_parts_LedState_Colors_Alpha)]) = this->rgba[(bijou_parts_LedState_Colors_Alpha)];
}

uint8 bijou_parts_LedState_LedState_getAlpha__E( bijou_parts_LedState_ this ) {
    return(  this->rgba[(bijou_parts_LedState_Colors_Alpha)]  );
}

uint8 bijou_parts_LedState_LedState_getRed__E( bijou_parts_LedState_ this ) {
    return(  this->rgba[(bijou_parts_LedState_Colors_Red)]  );
}

uint8 bijou_parts_LedState_LedState_getGreen__E( bijou_parts_LedState_ this ) {
    return(  this->rgba[(bijou_parts_LedState_Colors_Green)]  );
}

bijou_parts_LedState_ bijou_parts_LedState_LedState_setBlue__E( bijou_parts_LedState_ this, uint8 blue ) {
    this->rgba[(bijou_parts_LedState_Colors_Blue)] = (blue);
    return(  this  );
}

void bijou_parts_LedState_LedState_setId__E( bijou_parts_LedState_ this, uint8 id ) {
    this->id = (id);
}

bijou_parts_LedState_ bijou_parts_LedState_LedState_setState__E( bijou_parts_LedState_ this, bijou_parts_LedState_ state ) {
    bijou_parts_LedState_LedState_getRGBA__E(state, this->rgba);
    return(  this  );
}

bijou_parts_LedState_ bijou_parts_LedState_LedState_setRGBA__E( bijou_parts_LedState_ this, uint8 red, uint8 green, uint8 blue, uint8 alpha ) {
    this->rgba[(bijou_parts_LedState_Colors_Red)] = (red);
    this->rgba[(bijou_parts_LedState_Colors_Green)] = (green);
    this->rgba[(bijou_parts_LedState_Colors_Blue)] = (blue);
    this->rgba[(bijou_parts_LedState_Colors_Alpha)] = (alpha);
    return(  this  );
}

void bijou_parts_LedState_LedState_getRGB__E( bijou_parts_LedState_ this, uint8  rgb[] ) {
    (rgb[(bijou_parts_LedState_Colors_Red)]) = this->rgba[(bijou_parts_LedState_Colors_Red)];
    (rgb[(bijou_parts_LedState_Colors_Green)]) = this->rgba[(bijou_parts_LedState_Colors_Green)];
    (rgb[(bijou_parts_LedState_Colors_Blue)]) = this->rgba[(bijou_parts_LedState_Colors_Blue)];
}

