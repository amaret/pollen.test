import pollen.environment as Bijou

from bijou.parts import Projector

module P0Test {
  
  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {

    Projector.start()
    Bijou.run()
  }

}