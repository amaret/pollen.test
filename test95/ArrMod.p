module ArrMod {

  host uint8 sizeHost = 8
  uint8 sizeTarg = 6

  uint8 targBuff_sizeHost[sizeHost]
  uint8 targBuff_nosize[] = { 1, 2, 3 }  // initializer no dimension
  uint8 targBuff_sizeTarg[sizeTarg]

  host uint8 hostBuff_sizeHost[sizeHost]
  host uint8 hostBuff_noSize[] = { 1, 2, 3 }  // initializer no dimension
  host uint8 hostBuff_sizeTarg[sizeTarg]
  host uint8 hostBuff_sizeConst[7] = { 0,1,2,3,4 } // filled in with 0s to 7 
  host uint8 hostBuff_sizeConst2[7] = { 3 } // filled in with 3s to 7 

  host ArrMod() {
  }
  public  foo() {
      uint8 i = hostBuff_sizeConst[2]
      print i
  }

}

