import DotMatrix
import RGBMatrixLed

module DotMatrixTest3 {

  host RGBMatrixLed leds[16] = { new RGBMatrixLed(1, 1, 2, 1, 3, 1),
                                new RGBMatrixLed(4, 1, 5, 1, 6, 1),
                                new RGBMatrixLed(1, 2, 2, 2, 3, 2),
                                new RGBMatrixLed(4, 2, 5, 2, 6, 2),
                                new RGBMatrixLed(1, 3, 2, 3, 3, 3),
                                new RGBMatrixLed(4, 3, 5, 3, 6, 3),
                                new RGBMatrixLed(1, 4, 2, 4, 3, 4),
                                new RGBMatrixLed(4, 4, 5, 4, 6, 4),
                                new RGBMatrixLed(1, 5, 2, 5, 3, 5),
                                new RGBMatrixLed(4, 5, 5, 5, 6, 5),
                                new RGBMatrixLed(1, 6, 2, 6, 3, 6),
                                new RGBMatrixLed(4, 6, 5, 6, 6, 6),
                                new RGBMatrixLed(1, 7, 2, 7, 3, 7),
                                new RGBMatrixLed(4, 7, 5, 7, 6, 7),
                                new RGBMatrixLed(1, 8, 2, 8, 3, 8),
                                new RGBMatrixLed(4, 8, 5, 8, 6, 8), }

  host uint8 perimLength = 12
  host uint8 perimeter[perimLength] = {0, 1, 2, 3, 7, 11, 15, 14, 13, 12, 8, 4}

  host DotMatrixTest3() {
    DotMatrix.setDimensionsOnHost(6, 8)
  }

  pollen.run() {
    uint8 hold = 125

    +{PMIC.CTRL}+ |= +{ PMIC_LOLVLEN_bm }+
    +{ sei() }+

    uint8 i = 0

    while (true) {

      DotMatrix.setBrightness(i++)
      if (i == 16) { i = 0 }

      // walk red
      walk(1, 0, 0, hold)
      walk(0, 0, 0, hold)
      // walk green
      walk(0, 1, 0, hold)
      walk(0, 0, 0, hold)
      // walk blue
      walk(0, 0, 1, hold)
      walk(0, 0, 0, hold)
      // walk white
      walk(1, 1, 1, hold)
      walk(0, 0, 0, hold)


    }
  }


  walk(uint8 red, uint8 green, uint8 blue, uint8 dt) {
    RGBMatrixLed led = null
    uint8 index = 0

    for (uint8 i = 0; i < perimLength; i++) {
      index = perimeter[i]
      led = leds[index]
      led.set(red, green, blue)
      DotMatrix.update()
      delay(dt)
    }
  }

  delay(uint8 ms) {
    +{ _delay_ms(`ms`) }+
  }
}