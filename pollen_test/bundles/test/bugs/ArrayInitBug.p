
import C1

module ArrayInitBug {
  
  enum Pos { Zero, One, Two }

  host C1 array[5] = { new C1(1), 
                       new C1(1),
                       new C1(1),
                       new C1(1),
                       new C1(1) }


  test(C1 c) {
    c.get()
  }

  pollen.run() {
    test(array[Pos.Zero])
  }

  pollen.shutdown() {

  }


}