
class Class1 {

  host uint8 z=7
  uint8 x=7

  public Class1() {
    x = 3
  }
  //public host Class1() {
  host public Class1() {
    z = 2
    classMethod()
  }
  host classMethod() {
    z = 3
  }
}
