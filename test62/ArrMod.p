module ArrMod {

  host uint8 sizeHost = 8
  uint8 sizeTarg = 6
  host uint8 errsizeHost = 7
  uint8 errsizeTarg = 5

  uint8 targBuff_sizeHost[sizeHost]
  uint8 targBuff_sizeTarg[sizeTarg]
  host uint8 hostBuff_sizeHost[sizeHost]
  host uint8 hostBuff_sizeTarg[sizeTarg]

  uint8 err_targBuff_sizeHost[errsizeHost]
  uint8 err_targBuff_sizeTarg[errsizeTarg]
  host uint8 err_hostBuff_sizeHost[errsizeHost]
  host uint8 err_hostBuff_sizeTarg[errsizeTarg]


  host ArrMod() {
     print "hostInit ArrMod() (after privateInit, after preset Initializer):\n"
     print " sizeHost " + sizeHost + "\n"
     print "   init on dcln to 8\n"
     print " sizeTarg " + sizeTarg + "\n"
     print "   init on dcln to 6\n"

     print " errsizeHost " + errsizeHost + "\n"
     print "   init on dcln to 7\n"
     print " errsizeTarg " + errsizeTarg + "\n"
     print "   init on dcln to 5\n"

  }
  public host sizes() {
     print "sizes ArrMod() (after privateInit, after preset Initializer):\n"
     print " sizeHost " + sizeHost + "\n"
     print "   init on dcln to 8\n"
     print " sizeTarg " + sizeTarg + "\n"
     print "   init on dcln to 6\n"

     print " errsizeHost " + errsizeHost + "\n"
     print "   init on dcln to 7\n"
     print " errsizeTarg " + errsizeTarg + "\n"
     print "   init on dcln to 5\n"

  }
}
