import pollen.environment as Bijou

from bijou.parts import ColorSpace
from bijou.parts import LedState
from pollen.math import Math

module ColorSpaceTest {
  
  host LedState led = new LedState(0)
  uint8 rgb[3] = { 0 }

  pollen.run() {
    uint8 i, j, k
    real h, s, v = 1.0

    for (i = 0; i < 255; i++) {
      h = i / 255.0
      v = 1.0

      for (j = 0; j < 255; j++) {
        s = j / 255.0

        ColorSpace.hsvToRgb(h, s, v, rgb)
        led.setRGBA(rgb[0], rgb[1], rgb[2], 255).apply()
      }

      for (k = 255; k > 1; k--) {
        v = k / 255.0
        ColorSpace.hsvToRgb(h, s, v, rgb)
        led.setRGBA(rgb[0], rgb[1], rgb[2], 255).apply()        
      }
    }
  }

}