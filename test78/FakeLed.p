import FakeProto
import FakePin

module FakeLed {
  
  FakeProto pin 

  host FakeLed() {
    print "FakeLed.hostInit: enter/exit\n"

  }

  public host testFunction() {
    print "FakeLed.testFunction: enter\n"
    FakePin.foo()
    pin.foo()
    print "FakeLed.testFunction: exit\n"
  }

}
