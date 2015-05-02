import pollen.environment as Bijou

# TEST bug issue pollen-69: pegged variable type not output (local variable)

module Test7 {

  +{ 
      #include <stdlib.h> 
      #include <stdio.h>
    }+

  string header = "oscsend 127.0.0.1 7000 /led/1 iii "  
  byte h [] @= header
  byte hh [] 
  byte data[50] = {0}
  uint8 pos = 0

  pollen.reset() {
  }

  pollen.run() {

    hh @= header
    strlen("hellllo")

  }

  pollen.shutdown(uint8 id) {

  }

  sendOscRGB(uint8 r, uint8 g, uint8 b) {
    //+{ system("oscsend 127.0.0.1 7000 /led/1 iii 255 255 127") }+
  }


  /////////////////////////////////////////////////////////////////////////////

  uint16 strlen(string s) {

    byte b[]
    b @= s

    byte bb[] @= s

    uint16 i = 0

    for (i = 0; b[i] != '\0'; i++) {
      print b[i] + "  "
    }
    print "\n" + i + "\n"

    return i
  }
}
