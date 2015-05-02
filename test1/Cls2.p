# TEST there was a bug with negative literals, they were taking precedence over unary expr. (Lex).
class Cls2 {

    uint32 us = 3
    uint32 ticksPerUs = 100

    public foo() { 
      uint32 i = 0
      i = ticksPerUs-10 
    }
  public markUsed() {}

}
  
