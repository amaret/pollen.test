

class TestClass {
  
  uint8 x = 0

  public TestClass setSomething(uint8 s) {
    @x = s
    print "setting something " + s + "\n"
    return @
  }

  public uint8 getSomething() {
    print "getting something " + @x + "\n"
    return @x
  }

}