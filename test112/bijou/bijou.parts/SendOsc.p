

module SendOsc {
  
  +{ #include <stdlib.h> }+

  string header = "oscsend 127.0.0.1 7000 /led/1 iii "  
  byte data[50] = {0}

  public sendRGB(uint8 r, uint8 g, uint8 b) {
    byte tmp[5]
    string t = tmp
    uint8 len = 0

    sprint(header, data, 0)

    itoa(r, tmp, 10)
    sprint(t, data, strlen(header))
    len = strlen(data)
    data[len] = ' '
    data[len + 1] = '\0'    
    itoa(g, tmp, 10)
    sprint(t, data, strlen(data))
    len = strlen(data)
    data[len] = ' '
    data[len + 1] = '\0'    
    itoa(b, tmp, 10)        
    sprint(t, data, strlen(data))

    +{ system(`data`) }+
  }

  uint16 strlen(string s) {
    byte b [] @= s
    uint16 i = 0

    while (b[i] != '\0') {
      i++
    }
    return i
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

  reverse(byte [] data, uint16 length) {
    uint16 start = 0
    uint16 end = length -1
    while (start < end) {
      byte b = data[start]
      data[start] = data[end]
      data[end] = b
      start++
      end--
    }
  }

  // Implementation of itoa()
  itoa(int32 num, byte [] str, uint8 base) {
    uint16 i = 0
    bool isNegative = false
   
    // Handle 0 explicitely, otherwise empty string is printed for 0
    if (num == 0) {
      str[i++] = '0'
      str[i] = '\0'
      return
    }
   
    // In standard itoa(), negative numbers are handled only with 
    // base 10. Otherwise numbers are considered unsigned.
    if (num < 0 && base == 10) {
      isNegative = true
      num = -num
    }
   
    // Process individual digits
    while (num != 0) {
      uint32 rem = num % base
      str[i++] = (rem > 9) ? (rem-10) + 0x61 : rem + 0x30
      num = num/base
    }
   
    // If number is negative, append '-'
    if (isNegative) {
      str[i++] = '-'
    }
   
    str[i] = '\0' // Append string terminator
   
    // Reverse the string
    reverse(str, i)   
  }


}