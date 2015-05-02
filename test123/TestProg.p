# TEST translation of pegging operator, casts

module TestProg {
  
  +{ #include <stdio.h> }+
  +{ #include <stdlib.h> }+

  uint8 _arr_u8[4] = {0,1,2,3}
  uint8  arr_u8[]
  uint16 arr_u16[]  
  uint32 arr_u32[] // @= _arr_u8 peg can't be used on dclns
  bool _arr_b[1] = { true }
  bool arr_b[] 


  pollen.run() {
      arr_u16 @= _arr_u8
      print "arr_u16[1]: " + arr_u16[1] + "\n"
      arr_u32 @= _arr_u8
      print "arr_u32[0]:"  + arr_u32[0] + "\n"
      arr_b @= _arr_u8
      print arr_b[0] + "\n"
      _arr_u8[0] = 1
      print arr_b[0] + "\n"

      +{ exit(0) }+
  }

}
