from pollen.hardware import LedProtocol

from bijou.pwm import PwmManager
from bijou.pwm import PwmChannel
from bijou.parts import Pixel

meta { type T = uint8 } module ColorLedMeta {
  
  host LedProtocol Red
  host PwmChannel redPwm = new PwmChannel(redOn, redOff)

  host LedProtocol Green
  host PwmChannel greenPwm = new PwmChannel(greenOn, greenOff)

  host LedProtocol Blue
  host PwmChannel bluePwm = new PwmChannel(blueOn, blueOff)

  host T rgba[4] = {0, 0, 0, 0}

  ColorLedMeta() {
    redPwm.start(0)
    greenPwm.start(0)
    bluePwm.start(0)
  }

  public setRGBA(T r, T g, T b, T a) {    
    rgba[0] = r
    rgba[1] = g
    rgba[2] = b
    rgba[3] = a
    setColor()
  }

  public setRGB(T r, T g, T b) {
    rgba[0] = r
    rgba[1] = g
    rgba[2] = b
    setColor()    
  }

  public setPixel(Pixel p) {
    p.getRGBA(rgba)
    setColor()
  }

  //---------------------------------------------------------------------------
  // Private functions 
  //---------------------------------------------------------------------------

  setColor() {
    redPwm.setDuty(rgba[0])
    greenPwm.setDuty(rgba[1])
    bluePwm.setDuty(rgba[2])
    // Nothing done with alpha yet!
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