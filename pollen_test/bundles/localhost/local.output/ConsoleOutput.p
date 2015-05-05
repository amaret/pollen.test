from pollen.output import PrintProtocol

module ConsoleOutput implements PrintProtocol {
  
  +{ #include <stdio.h> }+


  public printBool(bool b) {  
    if (b) {
      +{ printf("true") }+
    } else {
      +{ printf("false") }+      
    }
  }

  public printReal(real f) {
    +{ printf("%f", (float)f) }+
  }

  //printInt(int32 i) {  }
  public printInt(int32 i) {  
   +{ printf("%d", `i`) }+
  }

  //printUInt(uint32 u) {  } 
  public printUint(uint32 u) {  
   +{ printf("%d", `u`) }+
  }

  //printString(string s) {  } 
  public printStr(string s) {  
   +{ printf("%s", `s`) }+
  }

  public startPrimary() { print "\033[0;34m" }

  public startSuccess() { print "\033[0;32m" }

  public startInfo() { print "\033[0;36m" }

  public startWarn() { print "\033[0;33m" }

  public startError() { print "\033[0;31m" }

  public endColor() { print "\033[0m" }

}
