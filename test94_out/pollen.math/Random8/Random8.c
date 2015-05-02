
/*
 * ======== string literals ========
 */

static const char pollen_math_Random8__s__fileName[] = "Random8.p";
static const char pollen_math_Random8__s__0[] = "Random8";

/*
 * ======== function definitions ========
 */

uint8 pollen_math_Random8_srand8__E( uint8 s ) {
    (pollen_math_Random8_seed__V) = (s);
    return(  pollen_math_Random8_rand8__E()  );
}

uint8 pollen_math_Random8_rand8f__E() {
    uint8 bit;
    
    do {
        (bit) = (((pollen_math_Random8_lfsr__V) >> 0) ^ ((pollen_math_Random8_lfsr__V) >> 2) ^ ((pollen_math_Random8_lfsr__V) >> 3) ^ ((pollen_math_Random8_lfsr__V) >> 5)) & 1;
        (pollen_math_Random8_lfsr__V) = ((pollen_math_Random8_lfsr__V) >> 1) | ((bit) << 7);
        ++(pollen_math_Random8_period__V);
    } while ((pollen_math_Random8_lfsr__V) != (pollen_math_Random8_seed__V));

    return(  (pollen_math_Random8_lfsr__V)  );
}

uint8 pollen_math_Random8_rand8__E() {
    uint8 lsb;
    lsb = 0;
    (lsb) = (pollen_math_Random8_lfsr__V) & 1;
    (pollen_math_Random8_lfsr__V) >>= 1;
    if ((lsb) == 1) {
        (pollen_math_Random8_lfsr__V) ^= 0xB0;
    }
    ++(pollen_math_Random8_period__V);
    return(  (pollen_math_Random8_lfsr__V)  );
}

void pollen_math_Random8_targetInit__I() {
}

