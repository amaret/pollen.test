from pollen.interfaces import I2C

module I2CUsi implements I2C {

	#enum ClockSource {SCLK, ACLK, SMCLK, USISWCLK, TACCR0, TACCR1}
	
	# some of these should be host variables
	uint32 slowestSlaveFrequency = 100000
	uint32 mcuFreq = 1000000

	#uint8 clockSource = ClockSource.SMCLK
	uint8 divisor
	uint8 source

	I2CUsi() {
		uint32 SCLFreq
		SCLFreq = 0
		
	    +{P1OUT}+ = 0xC0		# Use P1.6 & P1.7 Pullups, others to 0
	    +{P1REN}+ |= 0xC0		# Enable P1.6 & P1.7 Pullups
	    +{P1DIR}+ = 0xFF
	    # +{P1SEL}+ = 0xC0
	
	    # Configure the clock source
        source = +{USISSEL_2}+	# SMCLK	    
        
	   
	    if(clockSource == SCLK) {
	        source = ^USISSEL_0
	    }
	    if(clockSource == ACLK) {
	        source = ^USISSEL_1
	    }
	    if(clockSource == SMCLK) {
	        source = ^USISSEL_2
	    }
	    if(clockSource == USISWCLK) {
	        source = ^USISSEL_4
	    }
	    if(clockSource == TACCR0) {
	        source = ^USISSEL_5
	    }
	    if(clockSource == TACCR1) {
	        source = ^USISSEL_6
	    }
   	   
	    # Find necessary SCL frequency for stable communication
	    # with all attached slaves
	    SCLFreq = mcuFreq # >> 4
	    divisor = 0
	    while(SCLFreq > slowestSlaveFrequency) {
	        SCLFreq >>= 1
	        divisor++
	    }
	    divisor <<= 5
	}

	public enableAsMaster() {
		+{ADC10AE0}+ = 0
    	#ADC10AE1 = 0

    	+{USICTL0    = USIPE7 | USIPE6 | USIMST | USISWRST}+  # ~USILSB
 	    +{USICTL1    = USII2C}+     # ~USICKPH
    	+{USICKCTL}+ = divisor | source | +{USICKPL}+
	    +{USICNT}+   = 0 	#USISCLREL  # ~USI16B
	    +{USICTL0   &= ~USISWRST}+
	    +{USICTL1   &= ~USIIFG}+
	}
	
	public enableAsSlave() {
	
	}
	
	---	
	Read a single byte from the bus. If ack is true, an ack will be sent. 
	Returns byte read.
	----
	public uint8 get(bool ack) {
		uint8 data

	    +{USICTL0 &= ~USIOE}+ 					# Disable output
            
    	+{USICNT = (USICNT & 0xE0) | 0x08}+ 	# Set the bit count
    
    	while(!ready()) {}	    				# Wait for all bits to be read        
    	data = +{USISRL}+						# Read the data
    	# Load the shift register with 0 for ACK or 1 for NACK (active LOW) 
    	+{USISRL}+ = ack ? 0x00 : 0x80    
	    +{USICTL0 |= USIOE}+					# Enable output
    	+{USICNT = (USICNT & 0xE0) | 0x01}+		# Set the bit count
    
    	while(!ready()) {}						# Wait for the bit to be transmitted
        
    	return data								# Return the read data	
	}
	
	----
	Write a single byte to the bus. Returns true if acked. 
	----
	public bool put(uint8 data) {	
	    +{USISRL}+ = data		    			# Write data into the shift register    
    	+{USICTL0 |= USIOE}+					# Enable output
    	+{USICNT = (USICNT & 0xE0) | 0x08}+     # Set the bit count
    	while(!ready()) {}		    		# Wait for all bits to be written    
    	+{USICTL0 &= ~USIOE}+					# Disable output
    	+{USICNT = (USICNT & 0xE0) | 0x01}+		# Load the counter with 1 to read the ack
    	while(!ready()){}
    
    	# Return the ACK if there is one
	    #return USISRL == 0x80 ? true : false
    	return (+{USISRL}+ & 0x01) ? true : false
	}
	
	----
	Sends a start condition to the addressed client and specify if writing or reading.
	----
	public bool start(uint8 address, bool write) {
	    +{USISRL}+ = 0					# Set the MSB of the shift register to 0    
    	+{USICTL0 |= USIOE | USIGE}+	# Latch/SDA output enabled
    	+{USICTL0 &= ~USIGE}+       	# Latch disabled	# added a ~
    
    	# Write address and read/write bit
    	# Return whether start was ACK'd or not
    	return put((address << 1) | (write ? 0 : 1))
	}

	----
	Send a stop condition on the bus
	----
	public stop() {
	    +{USICTL0 |= USIOE}+		   			# Enable output
    	+{USISRL}+ = 0	    					# Set the MSB of the shift register to 0    
    	+{USICNT = (USICNT & 0xE0) | 0x01}+     # Read one bit
    	while(!ready()) {}		    		# Wait until we have read the bit
    	+{USISRL}+ = 0xFF						# Set the register all high
       	+{USICTL0 |= USIGE}+					# Set low-to-high transition
    
    	# Resume normal latching, disable output
    	+{USICTL0 &= ~USIOE & ~USIGE}+
	}
	
	bool ready() {
		# Check the USIIFG interrupt flag. This is automatically set whenever
    	# the USICNTx is 0, and automatically cleared whenever USICNTx != 0
   	    return +{(USICTL1 & USIIFG)}+ ? true : false
	}
}