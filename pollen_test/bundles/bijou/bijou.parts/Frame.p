from bijou.parts import CommonLookups
from bijou.parts import Color
from bijou.parts import Projector

class Frame {

  host uint32 duration = 0
  host uint16 segments = 0

  host uint8 numPixels = 1
  host Color pixel = new Color(0, 0, 0, 0)
  host CommonLookups.handleFrame(Frame) frameHandler = null

  public host Frame(uint32 duration, uint16 segments) {
    @duration = duration
    @segments = segments
  }

  public host setNumPixelsOnHost(uint8 num) {
    numPixels = num
  }

  public host setFrameHandlerOnHost(HP.handlerU8U8 h) {
    frameHandler = h
  }

  public project(Projector.project(Color) proj) {

    // Generate, PixelGenerator, maybe the iterators, R, G, B and RGB generators....
    if (frameHandler != null) { frameHandler(@) } 

    proj(pixel)
  }

  // BUG - return should not be like this! 
  public Color getColor() { return +{ &(this->pix) }+ }

  public uint32 getDuration() { return @duration }  

  public uint16 getNumSegments() { return @segments }  

  public uint8 getNumPixels() { return @numPixels }  

  public bool isHandlerSet() { return frameHandler != null }

}