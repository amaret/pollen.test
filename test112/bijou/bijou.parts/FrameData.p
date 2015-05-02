import Lookup

class FrameData {
  
  host uint32 duration = 0
  host uint16 segments = 0

  host Pixel pix = new Pixel(0, 0, 0, 0)  

  
  host uint16 size

  host Filter(uint16 size) {
    @size = size
  }

  public getLength() { return @size }

  public get(uint16 index) {
    if (index < size) { return Lookup.gamma(index) }
  }

}