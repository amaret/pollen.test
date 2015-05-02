import ArrConfig
import ArrMod
import ArrHostDim
import ArrCls

# TEST preset intializers with array dimensions
# TEST Verify that it is okay to set a host variable dimension to a host array
# TEST in module scope to a non constant value - it will be resolved at host time.
# TEST error cases for array dimension

module Test {

        host ArrCls ac = new ArrCls()
        host ArrHostDim.ClsHostDim cls = new  ArrHostDim.ClsHostDim()
        host Test() {
          ArrMod.sizes()
          ArrHostDim.sizes()
          cls.sizes()
          ArrHostDim.ClsHostDim.sizes()
          ac.sizes()
        }
        pollen.run() {
        }
}
