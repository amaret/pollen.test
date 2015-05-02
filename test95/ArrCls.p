class ArrCls {

  
  uint8 targBuff_sizeConst[7] = { 0,1,2,3,4,5,6}
  host uint8 hostBuff_sizeConst[3]

  public host ArrCls() {
    targBuff_sizeConst[0] = 1
    hostBuff_sizeConst[0] = 1
  }
  public host prn() { } 
}

