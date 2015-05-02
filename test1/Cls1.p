#TEST a package name that does not match the directory name (error)
package NotAPackage
class Cls1 {

  
    uint8 red = 1
    uint8 green
  
    uint8 blue = 7
    host uint8 blueInitialValue = 3

    public host Cls1(uint8 j) { 
      if (blueInitialValue == 3) {
        blue = j   // preset did not take effect
      }
      else {
        blue = blueInitialValue   // preset did take effect
      }
    }
  public markUsed() {}

}
  
