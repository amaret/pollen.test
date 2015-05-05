

module FloorCeil {


  public uint8 ceildivU8(uint8 x, uint8 y) {
     return (x + y - 1) / y
  }

  public uint16 ceildivU16(uint8 x, uint8 y) {
     return (x + y - 1) / y
  }
  
!--

    floor(x)             based on floorf(x) (newlib)
      Return x rounded toward -inf to integral value
    Method:
      Bit twiddling.
    Exception:
      Inexact flag raised if x not equal to floor(x).

    Developed at SunPro, a Sun Microsystems, Inc. business.
    Permission to use, copy, modify, and distribute this
    software is freely granted, provided that this notice is preserved.
    Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
    Conversion to float by Ian Lance Taylor, Cygnus Support, ian@cygnus.com.
 
--!

+{

    typedef union // A union to convert between a float and a 32 bit int. 
    {
        float value;
        uint32 word;
    } ieee_float_shape_type;
    
    #define FLT_UWORD_IS_FINITE(x) ((x)<0x7f800000L)
    #define FLT_UWORD_IS_ZERO(x) ((x)==0)
    
    static const float huge = 1.0e30;
}+

  public real floor(real x) {

      int32  i0,j0
      uint32 i,ix

      +{


      ieee_float_shape_type flt_u;
      flt_u.value = x;
      i0 = flt_u.word;

      ix = (i0&0x7fffffff);
      j0 = (ix>>23)-0x7f;

      if(j0<23) {
          if(j0<0) {            /* raise inexact if x != 0 */
              if(huge+x>(float)0.0) {/* return 0*sign(x) if |x|<1 */
                  if(i0>=0) {
                      i0=0;
                  }
                  else if(!FLT_UWORD_IS_ZERO(ix))
                  {
                      i0=0xbf800000;
                  }
              }
          } else {

              i = (0x007fffff)>>j0;

              if((i0&i)==0)
                  return x; /* x is integral */

              if(huge+x>(float)0.0) { /* raise inexact flag */
                  if(i0<0)
                      i0 += (0x00800000)>>j0;
                  i0 &= (~i);
              }
          }
      } else {
          if(!FLT_UWORD_IS_FINITE(ix))
              return x+x; /* inf or NaN */
          else
              return x;   /* x is integral */
      }
      flt_u.word = i0;
      x = flt_u.value;
      }+
      return x;
  }


!--
    ceil()              based on ceilf() (newlib)
      Return x rounded toward +inf to integral value
    Method:
      Bit twiddling.
    Exception:
      Inexact flag raised if x not equal to ceil(x).

    
    Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
    Developed at SunPro, a Sun Microsystems, Inc. business.
    Permission to use, copy, modify, and distribute this
    software is freely granted, provided that this notice
    is preserved.
    Conversion to float by Ian Lance Taylor, Cygnus Support, ian@cygnus.com.
--!

  public real ceil(real x) {

      int32  i0,j0;
      uint32 i,ix;
      +{

          ieee_float_shape_type flt_u;
          flt_u.value = x;
          i0 = flt_u.word;

          ix = (i0&0x7fffffff);
          j0 = (ix>>23)-0x7f;
          if(j0<23) {
              if(j0<0) {                  /* raise inexact if x != 0 */
                  if(huge+x>(float)0.0) { /* return 0*sign(x) if |x|<1 */
                      if(i0<0) {
                          i0=0x80000000;
                      }
                      else if(!FLT_UWORD_IS_ZERO(ix)) {
                          i0=0x3f800000;
                      }
                  }
              } else {
                  i = (0x007fffff)>>j0;
                  if((i0&i)==0) return x; /* x is integral */
                  if(huge+x>(float)0.0) { /* raise inexact flag */
                      if(i0>0) i0 += (0x00800000)>>j0;
                      i0 &= (~i);
                  }
              }
          } else {
              if(!FLT_UWORD_IS_FINITE(ix)) return x+x; /* inf or NaN */
              else return x;  /* x is integral */
          }

          flt_u.word = i0;
          x = flt_u.value;

      }+
      return x;
  }  
}