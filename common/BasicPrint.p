import PrintProtocol

module BasicPrint implements PrintProtocol {
  
  public printBool(bool b) {  }

  public printInt(int32 i) {  }

  public printReal(real f) {  }

  public printUint(uint32 u) {  }

  public printString(string s) {  }

  public host startPrimary() { print "\033[0;34m" }

  public host startSuccess() { print "\033[0;32m" }

  public host startInfo() { print "\033[0;36m" }

  public host startWarn() { print "\033[0;33m" }

  public host startError() { print "\033[0;31m" }

  public host endColor() { print "\033[0m" }
}
