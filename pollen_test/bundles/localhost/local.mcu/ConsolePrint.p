package local.mcu

from pollen.output import PrintProtocol

module ConsolePrint implements PrintProtocol {
  
  +{ #include <stdio.h> }+

  const string HEADER = "\033[95m"
  const string OKBLUE = "\033[94m"
  const string OKGREEN = "\033[92m"
  const string WARNING = "\033[93m"
  const string FAIL = "\033[91m"
  const string ENDC = "\033[0m"

  public printBool(bool b) {
    if (b) {
      +{ printf("true") }+
    } else {
      +{ printf("false") }+
    }
  }

  public printInt(int32 i) {
    +{ printf("%i", i) }+
  }

  public printReal(real f) {
    +{ printf("%f", (float)f) }+
  }

  public printUint(uint32 u) {
    +{ printf("%iu", u) }+
  }

  public printStr(string s) {
    +{ printf("%s", s) }+  
  }

}
