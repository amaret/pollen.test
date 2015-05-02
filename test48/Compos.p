import Arr
import ProtoMem
# TEST export with protocol member
composition Compos {
  export ProtoMem
  preset Compos() {
    ProtoMem.arr := Arr
  }
  host Compos() {
    print "Compos hostInit\n"
    //ProtoMem.arr := Arr
  }
}
