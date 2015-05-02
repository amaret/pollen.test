
/*
 * ======== string literals ========
 */

static const char test15_Msp430g2231__s__fileName[] = "Msp430g2231.p";
static const char test15_Msp430g2231__s__0[] = "Msp430g2231";

/*
 * ======== code injections ========
 */

 #include <msp430g2231.h> 

/*
 * ======== function definitions ========
 */

void test15_Msp430g2231_wait__E( uint32 us ) {
}

void test15_Msp430g2231_pollen__run__E() {
}

void test15_Msp430g2231_reset__E() {
    WDTCTL = WDTPW | WDTHOLD;

    BCSCTL1 = CALBC1_1MHZ;

    DCOCTL = CALDCO_1MHZ;

    if ((test15_Msp430g2231_mclkFrequency__V) == 1000000) {
        if ((test15_Msp430g2231_smclkFrequency__V) == 500000) {
            BCSCTL2 = DIVS_1;

        }
        else if ((test15_Msp430g2231_smclkFrequency__V) == 250000) {
            BCSCTL2 = DIVS_2;

        }
        else if ((test15_Msp430g2231_smclkFrequency__V) == 125000) {
            BCSCTL2 = DIVS_3;

        }
    }
    else if ((test15_Msp430g2231_mclkFrequency__V) == 500000) {
        BCSCTL2 = DIVM_1;

        if ((test15_Msp430g2231_smclkFrequency__V) == 250000) {
            BCSCTL2 = DIVS_1;

        }
        else if ((test15_Msp430g2231_smclkFrequency__V) == 125000) {
            BCSCTL2 = DIVS_2;

        }
        else if ((test15_Msp430g2231_smclkFrequency__V) == 62500) {
            BCSCTL2 = DIVS_3;

        }
    }
    else if ((test15_Msp430g2231_mclkFrequency__V) == 250000) {
        BCSCTL2 = DIVM_2;

        if ((test15_Msp430g2231_smclkFrequency__V) == 125000) {
            BCSCTL2 = DIVS_1;

        }
        else if ((test15_Msp430g2231_smclkFrequency__V) == 62500) {
            BCSCTL2 = DIVS_2;

        }
        else if ((test15_Msp430g2231_smclkFrequency__V) == 31250) {
            BCSCTL2 = DIVS_3;

        }
    }
    else if ((test15_Msp430g2231_mclkFrequency__V) == 125000) {
        BCSCTL2 = DIVM_3;

        if ((test15_Msp430g2231_smclkFrequency__V) == 62500) {
            BCSCTL2 = DIVS_1;

        }
        else if ((test15_Msp430g2231_smclkFrequency__V) == 31250) {
            BCSCTL2 = DIVS_2;

        }
        else if ((test15_Msp430g2231_smclkFrequency__V) == 15625) {
            BCSCTL2 = DIVS_3;

        }
    }
    else {
    }
}

void test15_Msp430g2231_targetInit__I() {
}

void test15_Msp430g2231_shutdown__E() {
}

void test15_Msp430g2231_nop__E() {
     asm("nop") ;

}

