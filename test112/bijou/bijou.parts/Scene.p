from bijou.pattern import PatternProtocol

class Scene {
  
  host PatternProtocol.start(Scene) startP = null       // this should be switched to an event later. 
  host PatternProtocol.stopped() stoppedP = null           // this should be switched to an event later. 

  host uint32 duration = 0

  public host Scene(uint32 duration, PatternProtocol.start shandler) {
    @duration = duration
    @startP = shandler
  }

  public start(PatternProtocol.stopped handler) {
    @stoppedP = handler

    print "Scene starting with duration " + @duration + "\n"

    if (startP != null) {
      startP(@)
    }
  }

  //
  // Stopped is called by the pattern once it is stopped. we use it to post
  // an event to notify the client.
  //
  public stopped() { 
    print "Scene: stopped...\n"

    if (@stoppedP != null) {
      @stoppedP()
      print "Called stopped handler!\n"
    }    
  }

  public uint32 getDuration() {
    return @duration
  }

}