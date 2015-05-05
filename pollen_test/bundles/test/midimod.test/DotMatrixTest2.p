
import DotMatrix

module DotMatrixTest2 {
  
  host DotMatrixTest2() {
    DotMatrix.setDimensionsOnHost(6, 8)
  }

  pollen.run() {

    +{PMIC.CTRL}+ |= +{ PMIC_LOLVLEN_bm }+
    +{ sei() }+

    while (true) {

      DotMatrix.setDot(1, 4)
      DotMatrix.update()
      +{ _delay_ms(250) }+

      DotMatrix.clearDot(1, 4)
      DotMatrix.update()    
      +{ _delay_ms(250) }+
    }
  }

}