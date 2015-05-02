# TEST combinations of valid / invalid preset init usage
# TEST for different array types: class arrays that are host, target
# TEST and have preset dimensions that are valid, invalid
class ArrCls {

  host uint8 cls_sizeHost = 4
  uint8 cls_sizeTarg = 2
  
  host uint8 err_cls_sizeHost = 1
  uint8 err_cls_sizeTarg = 3

  uint8 targBuff_sizeHost[cls_sizeHost]
  uint8 targBuff_sizeTarg[cls_sizeTarg]
  host uint8 hostBuff_sizeHost[cls_sizeHost]
  host uint8 hostBuff_sizeTarg[cls_sizeTarg]

  uint8 err_targBuff_sizeHost[err_cls_sizeHost]
  uint8 err_targBuff_sizeTarg[err_cls_sizeTarg]
  host uint8 err_hostBuff_sizeHost[err_cls_sizeHost]
  host uint8 err_hostBuff_sizeTarg[err_cls_sizeTarg]

  public host ArrCls() {
     print "hostInit ArrCls() (after privateInit, before preset Initializer):\n"
     print " cls_sizeHost " + cls_sizeHost + "\n"
     print "   init on dcln to 4\n"
     print " cls_sizeTarg " + cls_sizeTarg + "\n"
     print "   init on dcln to 2\n"

     print " err_cls_sizeHost " + err_cls_sizeHost + "\n"
     print "   init on dcln to 4\n"
     print " err_cls_sizeTarg " + err_cls_sizeTarg + "\n"
     print "   init on dcln to 2\n"
  }
  public host sizes() {
     print "sizes ArrCls() (after privateInit, after preset Initializer):\n"
     print " cls_sizeHost " + cls_sizeHost + "\n"
     print "   init on dcln to 4\n"
     print " cls_sizeTarg " + cls_sizeTarg + "\n"
     print "   init on dcln to 2\n"

     print " err_cls_sizeHost " + err_cls_sizeHost + "\n"
     print "   init on dcln to 4\n"
     print " err_cls_sizeTarg " + err_cls_sizeTarg + "\n"
     print "   init on dcln to 2\n"
  }
}

