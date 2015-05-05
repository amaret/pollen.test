package local.output

from pollen.text import Text


module SendOsc {
  
  +{ #include <stdlib.h> }+

  string header = "oscsend 127.0.0.1 7000 /led/1 iii "  
  byte data[50] = {0}

  public sendRGB(uint8 r, uint8 g, uint8 b) {
    byte tmp[5]
    string t = tmp
    uint8 len = 0

    sprint(header, data, 0)

    Text.itoa(r, tmp, 10)
    sprint(t, data, Text.strlen(header))
    len = Text.strlen(data)
    data[len] = ' '
    data[len + 1] = '\0'    
    Text.itoa(g, tmp, 10)
    sprint(t, data, Text.strlen(data))
    len = Text.strlen(data)
    data[len] = ' '
    data[len + 1] = '\0'    
    Text.itoa(b, tmp, 10)        
    sprint(t, data, Text.strlen(data))

    +{ system(`data`) }+
  }

  sprint(string s, byte [] data, uint16 start) {
    byte b [] @= s
    uint16 i = 0

    while(b[i] != '\0') {
      data[start + i] = b[i]
      i++
    }
    data[start + i] = '\0'
  }


}