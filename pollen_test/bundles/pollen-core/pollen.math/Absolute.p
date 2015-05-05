

module Absolute {
  

  !--

      abs32(), abs16(), abs8()
      Return the absolute value of the signed integer parameter.

  --!

  public int8 abs8(int8 i) {
      if (i < 0) {
          i = -i
      }
      return i
  }

  public int16 abs16(int16 i) {
      if ( i < 0) {
          i = -i
      }
      return i
  }

  public int32 abs32(int32 i) {
      if ( i < 0) {
          i = -i
      }
      return i
  }


}