----
TEST host variable initialization and code injection
TEST note target specific files are MISSING

This module provides an msp430g2231 specific implementation of the Mcu interface.

The MCLK and SMCLK are configured here. Possible combinations are:
MCLK: 1MHz,    SMCLK: 1MHz,    500KHz,     250KHz,     125KHz
MCLK: 500KHz,  SMCLK: 500KHz,  250KHz,     125KHz,     62.5KHz
MCLK: 250KHz,  SMCLK: 250KHz,  125KHz,     62.5KHz,    31.25KHz
MCLK: 125KHz,  SMCLK: 125KHz,  62.5KHz,    31.25KHz,   15.625KHz

----

#from pollen.interfaces import Mcu as McuI
#from mcu.ti.msp430 import Msp430
#from mcu.ti.msp430 import Wait

module Msp430g2231 { //implements McuI {	# implements Msp430 (when protocol inheritance works)

	host uint32 mclkFrequency = 1000000
	host uint32 smclkFrequency = 1000000
	host uint32 aclkFrequency = 0

	+{ #include <msp430g2231.h> }+

	----
	This function needs a revamp! Leverage the host to figure shit out.
	----
	public reset() {

	    +{WDTCTL = WDTPW | WDTHOLD}+         	# Stop watchdog timer
	    +{BCSCTL1 = CALBC1_1MHZ}+			# Set MCLK to calibrated 1MHZ
	    +{DCOCTL = CALDCO_1MHZ}+
	    
    	if (mclkFrequency == 1000000) {      		
		    #+{DCOCTL}+ = 0
        
	        if(smclkFrequency == 500000) {	 	# Set SMCLK to 1/2 MCLK
	            +{BCSCTL2 = DIVS_1}+
	        } elif (smclkFrequency == 250000) { 	# Set SMCLK to 1/4 MCLK
	            +{BCSCTL2 = DIVS_2}+
	        } elif (smclkFrequency == 125000) { 	# Set SMCLK to 1/8 MCLK
	            +{BCSCTL2 = DIVS_3}+
	        }
	    } elif (mclkFrequency == 500000) {
	        +{BCSCTL2 = DIVM_1}+			  # Set divider for 1/2 MCLK
        
        	if(smclkFrequency == 250000) {	 	  # Set SMCLK to 1/2 MCLK
	            +{BCSCTL2 = DIVS_1}+
    	    } elif (smclkFrequency == 125000) {   # Set SMCLK to 1/4 MCLK
	            +{BCSCTL2 = DIVS_2}+
	        } elif (smclkFrequency == 62500) {    # Set SMCLK to 1/8 MCLK
	            +{BCSCTL2 = DIVS_3}+
	        }
    	} elif (mclkFrequency == 250000) { 
        	+{BCSCTL2 = DIVM_2}+			 	  # Set divider for 1/4 MCLK
        
        	if (smclkFrequency == 125000) { 	  # Set SMCLK to 1/2 MCLK
            	+{BCSCTL2 = DIVS_1}+
        	} elif (smclkFrequency == 62500) {    # Set SMCLK to 1/4 MCLK
            	+{BCSCTL2 = DIVS_2}+
        	} elif (smclkFrequency == 31250) {    # Set SMCLK to 1/8 MCLK
            	+{BCSCTL2 = DIVS_3}+
        	}
    	} elif (mclkFrequency == 125000) {
            +{BCSCTL2 = DIVM_3}+			  # Set divider for 1/8 MCLK
                	        
	    	if (smclkFrequency == 62500) {        # Set SMCLK to 1/2 MCLK
            	+{BCSCTL2 = DIVS_1}+
        	} elif(smclkFrequency == 31250) {     # Set SMCLK to 1/4 MCLK
 	           	+{BCSCTL2 = DIVS_2}+
        	} elif(smclkFrequency == 15625) {     # Set SMCLK to 1/8 MCLK
            	+{BCSCTL2 = DIVS_3}+
        	}
    	} else {
    		# Notify of wrong configuration settings
    	}
    	
    	# +{BCSCTL1 &= ~(XTS)}+         # set XTS bit to low frequency mode
	# +{BCSCTL2}+ |= 0x5            # divide the SM clock by 8
    	# +{BCSCTL3 |= LFXT1S_0}+       # set ACLK to 32768Hz crystal
	}

	public shutdown() {
	}
	public pollen.run() {
	}
	
	public wait(uint32 us) {
	}
	
	public nop() {
        +{ asm("nop") }+		
	}
}
