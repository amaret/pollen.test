import MidiModBoard as Board

from atmel.xmega import ATxmega16C4 as Mcu
from Mcu import GlobalInterrupts

from Mcu import PA0 as AD4
from Mcu import PA1 as AD5
from Mcu import PA5 as AD0
from Mcu import PA6 as AD1
from Mcu import PA7 as AD2

from Mcu import PB0 as AD3
from Mcu import PB3

from Mcu import PC0 as D0
from Mcu import PC1 as D1
from Mcu import PC3 as D2
from Mcu import PC4 as D3
from Mcu import PC7 as D4

from Mcu import PE2 as UsbI2CSwitch
from Mcu import PE3 as I2CMasterSwitch

//from Mcu import TwiMasterPortC as InterTwiMaster
//from Mcu import TwiMasterPortE as ExpansionTwiMaster

//from Mcu import TwiMasterReadInterruptPortE
//from Mcu import TwiMasterWriteInterruptPortE as ExpansionTwiMasterWriteInterrupt


from pollen.parts import LedMeta{true} as StatusLed

composition MidiModEnv {

  preset MidiModEnv() {
    Mcu.setFrequencyOnHost(32000000)    // Note Mcu always starts at 2MHz frequency for now...
    StatusLed.pin  := PB3
  }

  export Board
  export Board.reset

  export Mcu
  export Mcu.wait
  export Mcu.cycle

  export GlobalInterrupts

  export StatusLed
  export UsbI2CSwitch
  export I2CMasterSwitch

  //export InterTwiMaster
  //export ExpansionTwiMaster
  //export ExpansionTwiMasterWriteInterrupt

  export PB3

  export AD0
  export AD1
  export AD2
  export AD3
  export AD4
  export AD5

  export D0
  export D1
  export D2
  export D3
  export D4

}