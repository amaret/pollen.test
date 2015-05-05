

module MinMax {

  public uint8 max8u (uint8 a, uint8 b) {
    if (a > b) { return a } 
    return b
  }

  public uint8 min8u (uint8 a, uint8 b) {
    if (a < b) { return a } 
    return b
  }

  public uint8 max8u3(uint8 a, uint8 b, uint8 c) {
    uint8 max = a

    if (b > max) {
      max = b
    }

    if (c > max) {
      max = c
    }

    return max
  }

  public uint8 min8u3(uint8 a, uint8 b, uint8 c) {
    uint8 min = a

    if (b < min) {
      min = b
    }

    if (c < min) {
      min = c
    }

    return min
  }

  public real maxr3(real a, real b, real c) {
    real max = a
    
    if (b > max) {
      max = b
    } 

    if (c > max) {
      max = c
    }

    return max
  }

  public real minr3(real a, real b, real c) {
    real min = a
    
    if (b < min) {
      min = b
    } 

    if (c < min) {
      min = c
    }

    return min
  }

}