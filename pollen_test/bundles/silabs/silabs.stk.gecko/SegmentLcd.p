

module SegmentLcd {

  +{ #include "em_cmu.h" }+  
  +{ #include "em_emu.c" }+  
  +{ #include "em_lcd.c" }+
  +{ #include "segmentlcd.h" }+
  +{ #include "segmentlcd.c" }+

  SegmentLcd() {
    +{ SegmentLCD_Init(false) }+    // Enable LCD without voltage boost 
  }

  public writeString(string s) {
    +{ SegmentLCD_Write(`s`) }+ 
  }

  public writeNumber(int16 num) {
    +{ SegmentLCD_Number(`num`) }+
  }

}