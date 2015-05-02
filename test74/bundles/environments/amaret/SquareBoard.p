
from atmel.xmega import ATxmega16C4 as Mcu

from Mcu import PA0
from Mcu import PA1
from Mcu import PA2
from Mcu import PA3
from Mcu import PA4
from Mcu import PA5
from Mcu import PA6
from Mcu import PA7

from Mcu import PB0
from Mcu import PB1
from Mcu import PB2
from Mcu import PB3

from Mcu import PC0
from Mcu import PC1
from Mcu import PC2
from Mcu import PC3
from Mcu import PC4
from Mcu import PC5
from Mcu import PC6
from Mcu import PC7

from Mcu import PD0
from Mcu import PD1
from Mcu import PD2
from Mcu import PD3


from pollen.parts import LedMeta{true} as Led0
from pollen.parts import LedMeta{true} as Led1
from pollen.parts import LedMeta{true} as Led2
from pollen.parts import LedMeta{true} as Led3
from pollen.parts import LedMeta{true} as Led4
from pollen.parts import LedMeta{true} as Led5
from pollen.parts import LedMeta{true} as Led6
from pollen.parts import LedMeta{true} as Led7
from pollen.parts import LedMeta{true} as Led8
from pollen.parts import LedMeta{true} as Led9
from pollen.parts import LedMeta{true} as Led10
from pollen.parts import LedMeta{true} as Led11
from pollen.parts import LedMeta{true} as Led12
from pollen.parts import LedMeta{true} as Led13
from pollen.parts import LedMeta{true} as Led14
from pollen.parts import LedMeta{true} as Led15
from pollen.parts import LedMeta{true} as Led16
from pollen.parts import LedMeta{true} as Led17
from pollen.parts import LedMeta{true} as Led18
from pollen.parts import LedMeta{true} as Led19
from pollen.parts import LedMeta{true} as Led20
from pollen.parts import LedMeta{true} as Led21
from pollen.parts import LedMeta{true} as Led22
from pollen.parts import LedMeta{true} as Led23

composition SquareBoard extends Mcu {
  
  preset SquareBoard() {
    Mcu.setFrequencyOnHost(32000000)

    Led0.pin  := PC7
    Led1.pin  := PC4
    Led2.pin  := PC3
    Led3.pin  := PB3
    Led4.pin  := PB0
    Led5.pin  := PA5
    Led6.pin  := PD0
    Led7.pin  := PC5
    Led8.pin  := PC2
    Led9.pin  := PB2
    Led10.pin := PA7
    Led11.pin := PA3
    Led12.pin := PD2  
    Led13.pin := PC6
    Led14.pin := PC1
    Led15.pin := PB1
    Led16.pin := PA4
    Led17.pin := PA2
    Led18.pin := PD3
    Led19.pin := PD1
    Led20.pin := PC0
    Led21.pin := PA6
    Led22.pin := PA1
    Led23.pin := PA0

  }

  export Mcu

  export Led0
  export Led1
  export Led2
  export Led3
  export Led4
  export Led5
  export Led6
  export Led7
  export Led8
  export Led9
  export Led10
  export Led11
  export Led12
  export Led13
  export Led14
  export Led15
  export Led16
  export Led17
  export Led18
  export Led19
  export Led20
  export Led21
  export Led22
  export Led23

}