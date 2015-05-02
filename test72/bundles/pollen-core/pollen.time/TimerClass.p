
class Timer {
  
  uint32 duration
  uint32 lapsed

  public Timer(uint32 ms) {

  }

  public  onTick() { 
  }


  public tick() { 
    if (++lapsed == duration) {
      onTick()
    }
  }

  public uint32 getDuration() {

  }

  public setDuration(uint32) {

  }



}