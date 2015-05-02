from pollen.hardware import HandlerProtocol as HP
from bijou.pattern import Lookup

meta { string name }
class LookupIterMeta {
  
  host uint8 size  = 0
  uint8 count = 0

  host (uint8 HP.handlerU8U8(uint8)) lookUp = name

  public host LookupIterMeta(uint8 size) {
    @size = size
  }

  public uint16 getSize() {
    return @size
  }

  public reset() {
    count = 0
  }

  public uint8 getNext() {
    uint8 val = lookUp(count++)
    if (count == size) {
      count == 0
    }
    return val
  }

  public uint8 getPrevious() {
    uint8 val = 0 

    if (count > 0) {
      val = lookUp(count--)      
    }
    return val
  }

  public uint8 get(uint8 index) {
    uint8 val = lookUp(index)
    count = index
    return val        // the tanslator didn't complain when I didn't have a return here!!!
  }

}