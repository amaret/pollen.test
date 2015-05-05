!-- 
  Color Space Conversion Functions
--!

from pollen.math import Math


module ColorSpace {
  

 // 
  // Converts an RGB color value to HSV. Conversion formula
  // adapted from http://en.wikipedia.org/wiki/HSV_color_space.
  // Assumes r, g, and b are contained in the set [0, 255] and
  // returns h, s, and v in the set [0, 1].
  // 
  public rgbToHsv(uint8 r, uint8 g, uint8 b, real [] hsv) {
    print "RGB to HSV: (" + r + ", " + g + ", " + b + ")\n"

    r = r/255
    g = g/255
    b = b/255

    uint8 max = Math.max8u3(r, g, b)
    uint8 min = Math.min8u3(r, g, b)
    hsv[2] = max

    uint8 d = max - min
    hsv[1] = (max == 0) ? 0 : d / max

    if (max == min) {
      hsv[0] = 0 // achromatic
    } else {
      if (max == r) {
        hsv[0] = (g - b) / d + (g < b ? 6 : 0)
      } elif (max == g) {
        hsv[0] = (b - r) / d + 2 
      } elif (max == b) {
        hsv[0] = (r - g) / d + 4           
      }

       hsv[0] = hsv[0] / 6.0
    }
  }

  // 
  // Converts an HSV color value to RGB. Conversion formula
  // adapted from http://en.wikipedia.org/wiki/HSV_color_space.
  // Assumes h, s, and v are contained in the set [0, 1] and
  // returns r, g, and b in the set [0, 255].
  // 
  public hsvToRgb(real h, real s, real v, uint8 [] rgb) {
    real r, g, b

    uint8 i = Math.floor(h * 6)
    real f = h * 6 - i
    real p = v * (1 - s)
    real q = v * (1 - f * s)
    real t = v * (1 - (1 - f) * s)

    // print "HSV to RGB: (" + h + ", " + s + ", " + v + ")\n"
    // print "[i=" + i + ", f=" + f + ", p=" + p + " q=" + q + " t=" + t + "]\n"
    
    switch(i % 6){
      case 0: 
        r = v; g = t; b = p
        break

      case 1: 
        r = q; g = v; b = p;
        break

      case 2: 
        r = p; g = v; b = t;
        break

      case 3: 
        r = p; g = q; b = v;
        break

      case 4: 
        r = t; g = p; b = v;
        break

      case 5: 
        r = v; g = p; b = q
        break
    }

    // print "[R=" + r + ", G=" + g + ", B=" + b + "]\n"

    rgb[0] = r * 255
    rgb[1] = g * 255
    rgb[2] = b * 255    
  }

  //
  // Converts an RGB color value to HSL. Conversion formula
  // adapted from http://en.wikipedia.org/wiki/HSL_color_space.
  // Assumes r, g, and b are contained in the set [0, 255] and
  // returns h, s, and l in the set [0, 1].
  //
  // rgbToHsl(uint8 r, uint8 g, uint8 b, real [] hsl) {
  //   real rgb[3] = { r / 255.0, g / 255.0, b / 255.0 }
  //   real max = Math.maxr3(rgb[0], rgb[1], rgb[2])
  //   real min = Math.minr3(rgb[0], rgb[1], rgb[2])
  //   hsl[0] = 0
  //   hsl[1] = 0
  //   hsl[2] = (max + min) / 2.0

  //   if (max == min) {
  //     hsl[0] = hsl[1] = 0 // achromatic
  //   } else {
  //     real d = max - min
  //     hsl[1] = hsl[2] > 0.5 ? d / (2 - max - min) : d / (max + min)

  //     switch (max) {  
  //       case rgb[0]: 
  //         hsl[1] = (rgb[1] - rgb[2]) / d + (rgb[1] < rgb[2] ? 6 : 0) 
  //         break

  //       case rgb[1]: 
  //         hsl[1] = (rgb[2] - rgb[1]) / d + 2
  //         break

  //       case rgb[2]: 
  //         hsl[1] = (rgb[0] - rgb[1]) / d + 4
  //         break;
  //     }

  //     hsl[1] /= 6;
  //   }
  // }

// 
// Converts an HSL color value to RGB. Conversion formula
// adapted from http://en.wikipedia.org/wiki/HSL_color_space.
// Assumes h, s, and l are contained in the set [0, 1] and
// returns r, g, and b in the set [0, 255].
// 
// hslToRgb(real h, real s, real l, uint8 [] rgb) {
//   if (s == 0) {
//     rgb[0] = rgb[1] = rgb[2] = l * 255       // achromatic
//   } else {
//     real q = l < 0.5 ? l * (1 + s) : l + s - l * s
//     real p = 2 * l - q
//     rgb[0] = hue2rgb(p, q, h + 1/3) * 255
//     rgb[1] = hue2rgb(p, q, h) * 255
//     rgb[2] = hue2rgb(p, q, h - 1/3) * 255
//   }
// }

// real hue2rgb(real p, real q, real t) {
//   if (t < 0) { t += 1 }
//   if (t > 1) { t -= 1 }
//   if (t < (1/6)) { return p + (q - p) * 6 * t }
//   if (t < (1/2)) { return q }
//   if (t < (2/3)) { return p + (q - p) * ((2/3) - t) * 6 }

//   return p
// }

}