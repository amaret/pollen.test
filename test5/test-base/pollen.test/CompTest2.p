----
Test: composition binds a module protocol member
----

import Comp

module CompTest1 {

    pollen.run() {
        Comp.reset()
        Comp.clear()
        Comp.makeOutput()
        
        while(true) {
            Comp.toggle()
            Comp.us(20000)
        }
    }
}