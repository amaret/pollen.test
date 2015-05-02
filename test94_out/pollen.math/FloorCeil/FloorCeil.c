
/*
 * ======== string literals ========
 */

static const char pollen_math_FloorCeil__s__fileName[] = "FloorCeil.p";
static const char pollen_math_FloorCeil__s__0[] = "FloorCeil";

/*
 * ======== code injections ========
 */



    typedef union // A union to convert between a float and a 32 bit int. 
    {
        float value;
        uint32 word;
    } ieee_float_shape_type;
    
    #define FLT_UWORD_IS_FINITE(x) ((x)<0x7f800000L)
    #define FLT_UWORD_IS_ZERO(x) ((x)==0)
    
    static const float huge = 1.0e30;


/*
 * ======== function definitions ========
 */

uint8 pollen_math_FloorCeil_ceildivU8__E( uint8 x, uint8 y ) {
    return(  ((x) + (y) - 1) / (y)  );
}

uint16 pollen_math_FloorCeil_ceildivU16__E( uint8 x, uint8 y ) {
    return(  ((x) + (y) - 1) / (y)  );
}

float pollen_math_FloorCeil_ceil__E( float x ) {
    int32 i0;
    int32 j0;
    uint32 i;
    uint32 ix;
    
    
    

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

      ;

    return(  (x)  );
}

float pollen_math_FloorCeil_floor__E( float x ) {
    int32 i0;
    int32 j0;
    uint32 i;
    uint32 ix;
    
    
    


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
      ;

    return(  (x)  );
}

void pollen_math_FloorCeil_targetInit__I() {
}

