from pollen.hardware import CpuProtocol

import Cpu
import GlobalInterrupts

import PinMeta{"PORTA", 0} as PA0
import PinMeta{"PORTA", 1} as PA1
import PinMeta{"PORTA", 2} as PA2
import PinMeta{"PORTA", 3} as PA3
import PinMeta{"PORTA", 4} as PA4
import PinMeta{"PORTA", 5} as PA5
import PinMeta{"PORTA", 6} as PA6
import PinMeta{"PORTA", 7} as PA7

import PinMeta{"PORTB", 0} as PB0
import PinMeta{"PORTB", 1} as PB1
import PinMeta{"PORTB", 2} as PB2
import PinMeta{"PORTB", 3} as PB3

import PinMeta{"PORTC", 0} as PC0
import PinMeta{"PORTC", 1} as PC1
import PinMeta{"PORTC", 2} as PC2
import PinMeta{"PORTC", 3} as PC3
import PinMeta{"PORTC", 4} as PC4
import PinMeta{"PORTC", 5} as PC5
import PinMeta{"PORTC", 6} as PC6
import PinMeta{"PORTC", 7} as PC7

import PinMeta{"PORTD", 0} as PD0
import PinMeta{"PORTD", 1} as PD1
import PinMeta{"PORTD", 2} as PD2
import PinMeta{"PORTD", 3} as PD3

import PinMeta{"PORTE", 0} as PE0
import PinMeta{"PORTE", 1} as PE1
import PinMeta{"PORTE", 2} as PE2
import PinMeta{"PORTE", 3} as PE3

// import TwiMasterMeta{"TWIC"} as TwiMasterPortC
// import TwiMasterMeta{"TWIE"} as TwiMasterPortE

// import InterruptMeta{ "TWIE_TWIM", "TWIE.MASTER", 
//                       "CTRLA", "TWI_MASTER_RIEN_bp", 
//                       "STATUS", "TWI_MASTER_RIF_bp" } as TwiMasterReadInterruptPortE

// import InterruptMeta{ "TWIE_TWIM", "TWIE.MASTER",
//                       "CTRLA", "TWI_MASTER_WIEN_bp", 
//                       "STATUS", "TWI_MASTER_WIF_bp" } as TwiMasterWriteInterruptPortE


import InterruptMeta{"TCC0_OVF", "TCC0", "INTCTRLA", "TC_OVFINTLVL_MED_gc", 
                     "INTFLAGS", "TC0_OVFIF_bm"} as Timer0_OverflowInterrupt

//import WatchdogTimer

composition ATxmega16C4 implements CpuProtocol {
  
  !---------------------
    Main device modules
   ---------------------! 
  export Cpu
  export Cpu.reset
  export Cpu.shutdown
  export Cpu.wait
  export Cpu.cycle
  export Cpu.getFrequency
  export Cpu.getFrequencyOnHost
  export Cpu.setFrequency
  export Cpu.setFrequencyOnHost

  export GlobalInterrupts
  //export WatchdogTimer

  !---------------------
    Interrupt Sources
   ---------------------! 
  export Timer0_OverflowInterrupt
  //export TwiMasterReadInterruptPortE
  //export TwiMasterWriteInterruptPortE

  !---------------------
    Serial Interfaces
   ---------------------! 
   // export TwiMasterPortC
   // export TwiMasterPortE

  !---------------------
    GPIO Pins
   ---------------------! 
  export PA0
  export PA1
  export PA2
  export PA3
  export PA4
  export PA5
  export PA6
  export PA7            

  export PB0
  export PB1
  export PB2
  export PB3

  export PC0
  export PC1
  export PC2
  export PC3
  export PC4
  export PC5
  export PC6
  export PC7            

  export PD0
  export PD1
  export PD2
  export PD3

  export PE0
  export PE1
  export PE2
  export PE3

}