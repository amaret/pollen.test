

meta {uint8 port, uint8 pin}

module MetaPinTest {
  
  +{ #include <stdio.h> }+

  public bool foo() {
    +{ printf("port %d, pin %d", `port`, `pin`) }+
  }

}