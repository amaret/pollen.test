
class Scene {
  
  host uint32 duration = 0

  public host Scene(uint32 duration) {
    @duration = duration
  }

  public uint32 getDuration() {
    return @duration
  }

}
