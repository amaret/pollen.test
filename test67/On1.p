import OnP
class On1 implements OnP {
  
  uint8 i = 0

  public on(uint8 i) {
     print ">>In On1.on(), with arg " + i + "\n"
  }
  public on_0() {
     print ">>In On1.on_0(), no args \n"
  }
  host public on_2_0() {
     print ">>In On1.on_2_0(), host fcn, no args \n"
  }
  public on_2_1() {
     print ">>In On1.on_2_1(), targ fcn, no args \n"
  }
}
