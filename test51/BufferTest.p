from pollen.net.transport import BufferManager
from pollen.net.transport import SingleBufferManager

# TEST BufferManager (xlated from em)
# TEST size set by preset


module BufferTest {

  +{ #include <stdio.h> }+
  

  public host BufferTest() {
      BufferManager.provider := SingleBufferManager
  }
  uint8 buf2[] = {0}

  public pollen.run() {
      uint16 i = BufferManager.getSize();
      uint8 buf[] = BufferManager.getBuffer();
      +{printf("%s %d\n", "size", `i`) }+
  }

}
