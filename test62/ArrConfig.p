import ArrMod
import ArrCls
composition ArrConfig {
  preset ArrConfig() {
    print "running ArrConfig() preset...\n"
    ArrMod.sizeHost = 16
    ArrMod.sizeTarg = 20
    ArrMod.errsizeHost = size()
    ArrMod.errsizeTarg = size()
    ArrCls.cls_sizeHost = 24
    ArrCls.cls_sizeTarg = 28
    ArrCls.err_cls_sizeHost = size()
    ArrCls.err_cls_sizeTarg = size()
    print "DONE ArrConfig() preset...\n"
  }
  host uint8 size() {
    return 16
  }
}
