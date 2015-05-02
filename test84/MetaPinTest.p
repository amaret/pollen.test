meta {uint8 port, uint8 pin}

# TEST replacing backticked meta parameter names with meta parameter values

module MetaPinTest {
  
  +{ #include <stdio.h> }+

  public bool foo() {
    +{ int i = `pin` }+
    +{ printf("port %d, pin %d", `port`, `pin`) }+
  }

}
