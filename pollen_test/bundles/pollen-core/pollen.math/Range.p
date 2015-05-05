

module Range {

  public uint8 map8(uint8 value, uint8 min1, uint8 max1, uint8 min2, uint8 max2) {
    uint8 endVal = 0
    uint8 oldRange = max1 - min1
    uint8 newRange = 0

    if (oldRange == 0) {
      endVal = min2
    } else {
      newRange = max2 - min2
      endVal = (((value - min1) * newRange) / oldRange) + min2
    }

    return endVal
  }
  
  public uint16 map16(uint16 value, uint16 min1, uint16 max1, uint16 min2, uint16 max2) {
    uint16 endVal = 0
    uint16 oldRange = max1 - min1
    uint16 newRange = 0

    if (oldRange == 0) {
      endVal = min2
    } else {
      newRange = max2 - min2
      endVal = (((value - min1) * newRange) / oldRange) + min2
    }

    return endVal
  }

  public uint32 map32(uint32 value, uint32 min1, uint32 max1, uint32 min2, uint32 max2) {
    uint32 endVal = 0
    uint32 oldRange = max1 - min1
    uint32 newRange = 0

    if (oldRange == 0) {
      endVal = min2
    } else {
      newRange = max2 - min2
      endVal = (((value - min1) * newRange) / oldRange) + min2
    }

    return endVal
  }
}