
import pollen.environment as Env
from pollen.time import Timer

module ArrayPass {

  host uint8 WriteBufferLength = 5
  string writeData[WriteBufferLength] = {null}
  string buffer[5]
  
  pollen.run() {
    writeData[0] = "A"
    writeData[1] = "B"
    writeData[2] = "C"
    writeData[3] = "D"
    writeData[4] = "E"

    printArray(writeData, 5)
  }

  printArray(string [] data, uint8 length) {

    for (uint8 i = 0; i < length; i++) {
      buffer[i] = data[i]
      print "byte " + i + " = " + data[i] + "\n"
    }    
  }

  pollen.shutdown() {
    print "Shutdown\n"
  }

}