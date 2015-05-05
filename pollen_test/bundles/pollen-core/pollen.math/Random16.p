
  !--

    Pseudo-random number generator using a 16-bit maximal period Galois linear feedback shift register (LFSR).

  --!


module Random16 {
  
  uint16 seed = 0xACE1        // Any nonzero start state will work. 
  uint16 lfsr = seed         
  uint16 period = 0

  public uint16 srand16(uint16 s) {
    seed = s
    return rand16()
  }
    
  // Galois LFSR
  public uint16 rand16() {  
    uint16 lsb = 0

    lsb = lfsr & 1          // Get LSB (i.e., the output bit).
    lfsr >>= 1              // Shift register 
    if (lsb == 1) {         // Only apply toggle mask if output bit is 1. 
      lfsr ^= 0xB400        // Apply toggle mask, value has 1 at bits corresponding to taps, 0 elsewhere. 
    }
    ++period
    
    return lfsr
  }

  // Fibonacci LFSR
  public uint16 rand16f() {
    uint16 bit
 
    // taps: 16 14 13 11; feedback polynomial: x^16 + x^14 + x^13 + x^11 + 1 
    bit  = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5) ) & 1
    lfsr =  (lfsr >> 1) | (bit << 15)
    ++period
 
    return lfsr
  }

}