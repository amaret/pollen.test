
import Absolute
import FloorCeil
import MinMax
import Random8
import Random16
import Range

composition Math {

  !--
    Absolute Value Functions
  --!
  export Absolute.abs8
  export Absolute.abs16
  export Absolute.abs32

  !--
    Floor and Ceiling Functions
  --!
  export FloorCeil.floor
  export FloorCeil.ceil
  export FloorCeil.ceildivU8
  export FloorCeil.ceildivU16

  !--
    Minimum and Maximum Functions
  --!
  export MinMax.min8u
  export MinMax.max8u
  export MinMax.min8u3
  export MinMax.max8u3
  export MinMax.minr3
  export MinMax.maxr3
    
  !--
    Random Number Functions
  --!
  export Random8.srand8
  export Random8.rand8
  export Random16.srand16
  export Random16.rand16
  export Random16.rand16f

  !--
    Range Mapping Functions
  --!
  export Range.map8
  export Range.map16
  export Range.map32

}
