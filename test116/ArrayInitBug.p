# TEST passing an array element from a host array to
# TEST a function which take an class instance parameter
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
    C1 c = array[0] #null
    c = array[0]
    test(c)
    test(array[Pos.Zero])
    test(array[0])
  }

  pollen.shutdown(uint8 id) {

  }


}
