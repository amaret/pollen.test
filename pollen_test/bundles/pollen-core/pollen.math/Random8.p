
  !--

    Pseudo-random number generator using a 16-bit maximal period Galois linear feedback shift register (LFSR).

  --!


module Random8 {
  
  uint8 seed = 0xAC        // Any nonzero start state will work. 
  uint8 lfsr = seed         
  uint8 period = 0

  host Random8() {
    seed = 0xAC
    lfsr = seed
    period = 0
  }

  public uint8 srand8(uint8 s) {
    seed = s
    return rand8()
  }
    
  // Galois LFSR
  public uint8 rand8() {  
    uint8 lsb = 0

    lsb = lfsr & 1          // Get LSB (i.e., the output bit).
    lfsr >>= 1              // Shift register 
    if (lsb == 1) {         // Only apply toggle mask if output bit is 1. 
      lfsr ^= 0xB0        // Apply toggle mask, value has 1 at bits corresponding to taps, 0 elsewhere. 
    }
    ++period
    
    return lfsr
  }

  // Fibonacci LFSR
  public uint8 rand8f() {
    uint8 bit
 
    do {
      // taps: 8 6 5 3; feedback polynomial: x^16 + x^14 + x^13 + x^11 + 1 
      bit  = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5) ) & 1
      lfsr =  (lfsr >> 1) | (bit << 7)
      ++period
    } while (lfsr != seed)
 
    return lfsr
  }

}