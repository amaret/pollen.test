import EventMeta{uint8} as Ev

module Mod1 {

    host Ev e = new Ev(myhandler)
    uint8 f = 7

    myhandler(uint8 p) {
        f = p
        print "handler parm " + p + "\n"
    }
    pollen.run() {
        e.handle(9)
    }
}
