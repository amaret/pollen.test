!--
  This is the Virtual ColorLed
  --!

package local.parts

from bijou.parts import LedState
from local.output import SendOsc

module ColorLed {
  
  host LedState state = new LedState(0)

  ColorLed() {
  }

  public setState(LedState led) {
    state.setState(led)
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
    uint8 r = state.getRed()
    uint8 g = state.getGreen()
    uint8 b = state.getBlue()
    uint8 a = state.getAlpha()
    print "ColorLed set [" + r + ", " + g + ", " + b + ", " + a + "]\n"
    SendOsc.sendRGB(r, g, b)
  }
    
}