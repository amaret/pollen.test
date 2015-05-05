
module PassEnumBug {
  
  enum MyEnum { ONE, TWO, THREE }

  pollen.run() {
    foobarredEnum(MyEnum.ONE)
  }

  // gives error: bugs.PassEnumBug.p, line 17:1, 'foobarredEnum': formal / actual parameter type conflict: <bugs.PassEnumBug, uint8>
  //foobarredEnum(MyEnum e) { }

  // gives error: bugs.PassEnumBug.p, line 13:2 no viable alternative at input 'foobarredEnum'
  // bugs.PassEnumBug.p, line 13:15 no viable alternative at input '('
  // bugs.PassEnumBug.p, line 13:28 missing '{' at 'e'
  foobarredEnum(enum MyEnum e) { }

}