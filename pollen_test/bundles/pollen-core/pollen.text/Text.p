package pollen.text

module Text {


  !--
    Implementation of itoa()
  --!
  
  public itoa(int32 num, byte [] str, uint8 base) {
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


  public reverse(byte [] data, uint16 length) {
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


// TODO insert BSD license

!--
    strcmp()

    Lexographic string compare.
    Requires two strings as input.
    Returns 0 for equality.
    Returns value < 0 for s1 < s2.
    Returns value > 0 for s1 > s2.

    Copyright (c) 1990, 1993
    The Regents of the University of California.  All rights reserved.

--!

 public int32 strcmp(string s1, string s2) {
  +{
         while (*`s1` == *`s2`++)
                 if (*`s1`++ == '\0')
                         return (0);
         return (*(const unsigned char *)`s1` - *(const unsigned char *)(`s2` - 1));
   }+
 }


!--
    strncmp()

    Lexographic string compare.
    Requires two strings as input and a compare length.
    Returns 0 for equality.
    Returns value < 0 for s1 < s2.
    Returns value > 0 for s1 > s2.

    Copyright (c) 1989, 1993
    The Regents of the University of California.  All rights reserved.

--!

 public int32 strncmp(string s1, string s2, uint16 n) {
    +{ 
         if (`n` == 0)
                 return (0);
         do {
                 if (*`s1` != *`s2`++)
                         return (*(const unsigned char *)`s1` -
                                 *(const unsigned char *)(`s2` - 1));
                 if (*`s1`++ == '\0')
                         break;
         } while (--`n` != 0);
         return (0);
    }+
 }

!--
    strlen()

    Returns the number of characters that 
    precede the null-terminating character.

    Copyright (c) 2009 David Schultz <das@FreeBSD.org>
    All rights reserved.

--!

  public uint16 strlen(string s) {
    byte b [] @= s
    uint16 i = 0

    while (b[i] != '\0') {
      i++
    }
    return i
  }


 // public uint16 strlen(string s)
 // {
 //    +{ 
 //         size_t len;

 //         for (len = 0 ;; len++, `s`++) {
 //                 if (!*`s`)
 //                         break;
 //         }
 //         return (len);
 //    }+
 // }
}

