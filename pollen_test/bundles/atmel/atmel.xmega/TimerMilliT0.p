package atmel.xmega

from pollen.hardware import HardwareTimerProtocol
from pollen.event import HandlerProtocol as HP

import Cpu

module TimerMilliT0 implements HardwareTimerProtocol {

  !-- Inject the ISR that calls the handler --!

  +{ ISR(TCC0_OVF_vect) { `handler`() } }+
  
  TimerMilliT0() {

    // Set the TC period to the computed period (cycles per ms..)
    TC_SetPeriod( &TCC0, 0xFFFF );

    # clear all TC0 interrupts & errors, set timer overflow interrupt level (enabling interrupt)
    +{ TCC0.INTFLAGS |= TC0_OVFIF_bm | TC0_ERRIF_bm }+

    /* Enable Compare channel A. */
    TC0_EnableCCChannels( &TCC0, TC0_CCAEN_bm );

  }

  public host TimerMilliT0() {
    !-- 
      In the future this should determine if its necessary to use the prescaler
      and compute the necessary values for both period and the prescaler.
    --!

    # Set a millisecond frequency depending on the Cpu frequency
    period = Cpu.getFrequencyOnHost() / 1000  
  }

  public host setHandlerOnHost(HP.handler h) {
    handler = h
  }

  public start() {


  /* Start timer by selecting a clock source. */
  TC0_ConfigClockSource( &TCC0, TC_CLKSEL_DIV1_gc );
  
  }
  
  public stop() {
  
  }
  
  public restart() {

  }

  public bool isRunning() {
  
  }

/*! \brief Configures clock source for the Timer/Counter 0.
 *
 *  This function clears the old clock source setting of the Timer/Counter and
 *  sets a new clock source according to the clockSelection parameter.
 *
 *  \param tc              Timer/Counter module instance.
 *  \param clockSelection  Timer/Counter clock source setting.
 */
void TC0_ConfigClockSource( volatile TC0_t * tc, TC_CLKSEL_t clockSelection )
{
  tc->CTRLA = ( tc->CTRLA & ~TC0_CLKSEL_gm ) | clockSelection;
}

/*! \brief Configures the Timer/Counter 0 for input capture operation.
 *
 *  This function sets the Timer/Counter in input capture mode and selects
 *  the event lines that will trigger the individual input capture channels.
 *
 *  \note Output compare operation is disabled when input capture operation is
 *  enabled.
 *
 *  \param tc               Timer/Counter module instance.
 *  \param eventSource      Event source selection.
 */
void TC0_ConfigInputCapture( volatile TC0_t * tc, TC_EVSEL_t eventSource )
{
  tc->CTRLD = ( tc->CTRLD & ~( TC0_EVSEL_gm | TC0_EVACT_gm ) ) |
              eventSource |
              TC_EVACT_CAPT_gc;
}

/*! \brief Sets the overflow interrupt level.
 *
 *  This function sets the overflow interrupt level of this Timer/Counter 0.
 *
 *  \param tc               Timer/Counter module instance.
 *  \param intLevel         New overflow interrupt level.
 */
void TC0_SetOverflowIntLevel( volatile TC0_t * tc, TC_OVFINTLVL_t intLevel )
{
  tc->INTCTRLA = ( tc->INTCTRLA & ~TC0_OVFINTLVL_gm ) | intLevel;
}

/*! \brief Sets the interrupt level for compare/capture channel A interrupt.
 *
 *  This function sets the interrupt level for compare/capture channel A
 *  interrupt in Timer/Counter 0.
 *
 *  \param tc               Timer/Counter module instance.
 *  \param intLevel         New compare/capture channel A interrupt level.
 */
void TC0_SetCCAIntLevel( volatile TC0_t * tc, TC_CCAINTLVL_t intLevel )
{
  tc->INTCTRLB = ( tc->INTCTRLB & ~TC0_CCAINTLVL_gm ) | intLevel;
}

/*! \brief Resets the Timer/Counter 0.
 *
 *  This function will reset the Timer/Counter. After calling this function,
 *  the Timer/Counter will be in the same state as it would after a full
 *  reset of the device.
 *
 *  \param tc  Timer/Counter 0 module instance.
 */
void TC0_Reset( volatile TC0_t * tc )
{
  /* TC must be turned off before a Reset command. */
  tc->CTRLA = ( tc->CTRLA & ~TC0_CLKSEL_gm ) | TC_CLKSEL_OFF_gc;

  /* Issue Reset command. */
  tc->CTRLFSET = TC_CMD_RESET_gc;
}



  !-- Private members --!

  host HP.handler() handler
  host uint16 period

}

