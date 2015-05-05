from pollen.hardware import LedProtocol

from bijou.pwm import PwmManager
from bijou.pwm import PwmChannel
from bijou.parts import LedState

module ColorLed {
  
  const real MaxBrightness = 1.0       // This throttles the brightness of the LED

  host LedProtocol Red
  host PwmChannel redPwm = new PwmChannel(redOn, redOff)

  host LedProtocol Green
  host PwmChannel greenPwm = new PwmChannel(greenOn, greenOff)

  host LedProtocol Blue
  host PwmChannel bluePwm = new PwmChannel(blueOn, blueOff)

  host LedState state = new LedState(0)

  ColorLed() {
    redPwm.start(0)
    greenPwm.start(0)
    bluePwm.start(0)
  }

  public setState(LedState led) {
    uint8 rgba[4] = {0}
    led.getRGBA(rgba)
    state.setRGBA(rgba[0], rgba[1], rgba[2], rgba[3])
    doSetColor()
  }

  public setRGBA(uint8 r, uint8 g, uint8 b, uint8 a) {    
    state.setRGBA(r, g, b, a)
    doSetColor()
  }

  public setRGB(uint8 r, uint8 g, uint8 b) {
    state.setRGB(r, g, b)
    doSetColor()    
  }

  public getRGB(uint8 [] data) {
    state.getRGB(data)
  }

  public getRGBA(uint8 [] data) {
    state.getRGBA(data)
  }

  //---------------------------------------------------------------------------
  // Private functions 
  //---------------------------------------------------------------------------

  doSetColor() {    
    real a = (state.getAlpha() / 255.0) * MaxBrightness       // brightness factor, i.e. alpha

    redPwm.setDuty(state.getRed() * a)
    greenPwm.setDuty(state.getGreen() * a)
    bluePwm.setDuty(state.getBlue() * a)  
  }

  //---------------------------------------------------------------------------
  // These are here because we can't pass protocol member function to host 
  // initializer above!
  //---------------------------------------------------------------------------
  redOn()     { Red.on() }
  redOff()    { Red.off() } 
  greenOn()   { Green.on() }
  greenOff()  { Green.off() }
  blueOn()    { Blue.on() }
  blueOff()   { Blue.off() }
    
}