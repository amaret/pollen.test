import FakePin as Pin
import FakeLed as Led

composition HostCallComp {
  
  preset HostCallComp() {
    print "HostCallComp.preset: enter\n"
    Led.pin := Pin
    print "HostCallComp.preset: exit\n"
  }

  export Led

}
