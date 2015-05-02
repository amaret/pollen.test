!--
 --!

from atmel.atmega import ATmega88 as Mcu
from Mcu import GlobalInterrupts
from Mcu import Timer0Overflow
from Mcu import Uart
from Mcu import PD5
from Mcu import PD6
from Mcu import PD7

from fuseproject import RGBLed

module Test_10 {

  // PWM Channel consts, arrays, data
  const uint8 RED = 0
  const uint8 GREEN = 1
  const uint8 BLUE = 2
  uint8 compare[3]
  volatile uint8 compbuff[3]
  const uint8 PWMDEFAULT = 0x0F  
  uint8 softcount = 0       // soft counter for pwm

  host new RGBLed rgb(PWMDEFAULT, PWMDEFAULT, PWMDEFAULT)

  // Fade related data
  enum FadeState {NOFADE = 0, PULSEUP = 1, PULSEDOWN = 2, PULSEHOLD = 3, WHITE = 4, COLOR = 5}
  const uint8 ticksPerMs = 32    
  uint8 msTickCount = 0

  uint8 fadeState = FadeState.NOFADE
  uint16 fadeInMs = 0
  uint16 fadeOutMs = 0
  uint16 fadeHoldMs = 0

  uint8 fadeInStep = 0
  uint8 fadeOutStep = 0
  uint16 fadeTickCount = 0


  host Test_10() {
    Mcu.setFrequencyOnHost(8000000)
    Uart.setBaudOnHost(38400)
  }

  Test_10() {   
    Timer0Overflow.setHandler(tick)    // register the interrupt service routine

    PD5.clear()
    PD6.clear()
    PD7.clear()    

    PD5.makeOutput()
    PD6.makeOutput()
    PD7.makeOutput()    

    compare[RED]   = compbuff[RED]   = rgb.getRed()
    compare[GREEN] = compbuff[GREEN] = rgb.getGreen()
    compare[BLUE]  = compbuff[BLUE]  = rgb.getBlue()
  }

  pollen.run() {
    Timer0Overflow.clear()
    Timer0Overflow.enable()
    +{ TCCR0B = (1 << CS00) }+   // start timer, no prescale
    GlobalInterrupts.enable()

    byte cmd

    while(true) {
      if (Uart.hasData()) {
        cmd = Uart.get()

        if (cmd == '#') {          
          fadeState = FadeState.NOFADE      // stop any fading that's happening.

          rgb.setRed(Uart.get())
          rgb.setGreen(Uart.get())
          rgb.setBlue(Uart.get())

          compbuff[RED]   = rgb.getRed()
          compbuff[GREEN] = rgb.getGreen()
          compbuff[BLUE]  = rgb.getBlue()
        } elif (cmd == '$') {
          
          fadeState = FadeState.NOFADE      // stop any fading that's happening.

          cmd = Uart.get()
          if (cmd == 'P') {                 // start pulse fade from color to white
            doFadeState(FadeState.PULSEUP)
          } elif (cmd == 'W') {             // fade to white
            doFadeState(FadeState.WHITE)
          } elif (cmd == 'C') {             // fade to color
            doFadeState(FadeState.COLOR)
          } 
        }
      }
    }   
  }

  doFadeState(uint8 state) {    
    uint8 min = 0

    if (state == FadeState.PULSEUP) {
      fadeInMs = getUInt16()
      fadeOutMs = getUInt16()
      fadeHoldMs = getUInt16()

      min = rgb.getMinValue()
      fadeInStep = fadeInMs / (255 - min) 
      fadeOutStep = fadeOutMs / (255 - min)
      fadeTickCount = 0
      fadeState = FadeState.PULSEUP
    } 

    elif (state == FadeState.WHITE || state == FadeState.COLOR) {
      fadeInMs = getUInt16()
      min = rgb.getMinValue()
      fadeInStep = fadeInMs / (255 - min)
      fadeTickCount = 0

      fadeState = (state == FadeState.WHITE) ? FadeState.WHITE : FadeState.COLOR
    }

  }

  tick() {

    if(++softcount == 0) {         // increment modulo 256 counter and update
                                  // the compare values only when counter = 0.
      compare[RED]   = compbuff[RED];   // verbose code for speed
      compare[GREEN] = compbuff[GREEN];
      compare[BLUE]  = compbuff[BLUE];   // last element should equal CHMAX - 1

      PD5.set()
      PD6.set()
      PD7.set()      
    }

    // clear port pin on compare match (executed on next interrupt)
    if(compare[RED]   == softcount) { PD5.clear() }
    if(compare[GREEN] == softcount) { PD6.clear() }
    if(compare[BLUE]  == softcount) { PD7.clear() }
  
    if ((fadeState != FadeState.NOFADE) && (++msTickCount == ticksPerMs)) { 
      msTickCount = 0
      tickFade() 
    }
  }

  // This function gets called every millisecond if a fade is in progress
  tickFade() {
    ++fadeTickCount

    if (fadeState == FadeState.PULSEUP) {
      if (fadeTickCount % fadeInStep == 0) { 
        updateFadeToWhite()

        if (fadeTickCount >= fadeInMs) {
          fadeTickCount = 0
          fadeState = FadeState.PULSEDOWN
        }
      }
    } 

    elif (fadeState == FadeState.PULSEDOWN) {
      if (fadeTickCount % fadeOutStep == 0) { 
        updateFadeToColor()

        if (fadeTickCount >= fadeOutMs) {
          fadeTickCount = 0

          if (fadeHoldMs > 0) {
            fadeState = FadeState.PULSEHOLD
          } else {
            fadeState = FadeState.PULSEUP
          }
        }
      }
    } 

    elif (fadeState == FadeState.PULSEHOLD) {     
      if (fadeTickCount >= fadeHoldMs) {
        fadeTickCount = 0
        fadeState = FadeState.PULSEUP
      }
    }

    elif (fadeState == FadeState.WHITE || fadeState == FadeState.COLOR) {
      if (fadeTickCount % fadeInStep == 0) { 
        if (fadeState == FadeState.WHITE) { 
          updateFadeToWhite() 
        } else { 
          updateFadeToColor() 
        }

        if (fadeTickCount >= fadeInMs) {
          fadeTickCount = 0
          fadeState = FadeState.NOFADE
        }
      }
    }
  }

  updateFadeToWhite() {
    if (fadeState == FadeState.WHITE || fadeState == FadeState.PULSEUP) {
      if (compbuff[RED] < 250) { compbuff[RED] += 1 }
      if (compbuff[GREEN] < 250) { compbuff[GREEN] += 1 }
      if (compbuff[BLUE] < 250) { compbuff[BLUE] += 1 }
    }
  }

  updateFadeToColor() {
    if (fadeState == FadeState.COLOR || fadeState == FadeState.PULSEDOWN) {    
      if (compbuff[RED] > rgb.getRed())     { compbuff[RED] -= 1 }
      if (compbuff[GREEN] > rgb.getGreen()) { compbuff[GREEN] -= 1 }
      if (compbuff[BLUE] > rgb.getBlue())   { compbuff[BLUE] -= 1 }
    }
  }

  uint16 getUInt16() {    
    uint16 val    
    uint8 lo, hi

    lo = Uart.get()  // low byte
    hi = Uart.get()  // high byte
    val = hi
    val = (val << 8) | lo

    return val
  }

}