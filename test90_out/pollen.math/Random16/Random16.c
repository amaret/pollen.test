
/*
 * ======== string literals ========
 */

static const char pollen_math_Random16__s__fileName[] = "Random16.p";
static const char pollen_math_Random16__s__0[] = "Random16";

/*
 * ======== function definitions ========
 */

uint16 pollen_math_Random16_srand16__E( uint16 s ) {
    (pollen_math_Random16_seed__V) = (s);
    return(  pollen_math_Random16_rand16__E()  );
}

uint16 pollen_math_Random16_rand16f__E() {
    uint16 bit;
    
    (bit) = (((pollen_math_Random16_lfsr__V) >> 0) ^ ((pollen_math_Random16_lfsr__V) >> 2) ^ ((pollen_math_Random16_lfsr__V) >> 3) ^ ((pollen_math_Random16_lfsr__V) >> 5)) & 1;
    (pollen_math_Random16_lfsr__V) = ((pollen_math_Random16_lfsr__V) >> 1) | ((bit) << 15);
    ++(pollen_math_Random16_period__V);
    return(  (pollen_math_Random16_lfsr__V)  );
}

uint16 pollen_math_Random16_rand16__E() {
    uint16 lsb;
    lsb = 0;
    (lsb) = (pollen_math_Random16_lfsr__V) & 1;
    (pollen_math_Random16_lfsr__V) >>= 1;
    if ((lsb) == 1) {
        (pollen_math_Random16_lfsr__V) ^= 0xB400;
    }
    ++(pollen_math_Random16_period__V);
    return(  (pollen_math_Random16_lfsr__V)  );
}

void pollen_math_Random16_targetInit__I() {
}

