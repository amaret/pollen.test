import FakeProto

module FakeLed {
  
  FakeProto pin 

  host FakeLed() {

  }

  public host testFunction() {
    pin.foo()
  }

}